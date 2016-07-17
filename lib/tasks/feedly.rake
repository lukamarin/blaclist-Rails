namespace :feedly_sources do
  task update: :environment do

    FeedlySource.all.each do |fs|
      fs.destroy unless fs.interests.any?
    end

    token = FeedlyTokens.get_token
    client = Feedlr::Client.new(oauth_access_token: token)

    Interest.all.each do |interest|
      begin
        response = client.search_feeds(interest.name)
        raise if response.errorCode && response.errorCode == 503
      rescue
        token = FeedlyTokens.get_token(token)

        if token.nil?
          puts "api requests limit reached for all tokens"
          break
        else
          puts "swapped api token to #{token}"
          client = Feedlr::Client.new(oauth_access_token: token)
          retry
        end
      end
      
      rss_feeds = response.results
      next if rss_feeds.blank?

      rss_feeds.each do |rss_feed|
        next unless rss_feed.language == "en"
        source = FeedlySource.find_by(feed_id: rss_feed.feedId)

        unless source.present?
          source = FeedlySource.create(feed_id: rss_feed.feedId, description: rss_feed.description,
                                                  title: rss_feed.title, icon_url: rss_feed.iconUrl)
          puts "created feedly source #{source.title}"
          interest.feedly_sources << source
          next
        end

        interest.feedly_sources << source unless interest.feedly_sources.exists?(feed_id: rss_feed.feedId)
      end
    end
  end
end

namespace :feedly_articles do
  task update: :environment do
    prev_year = DateTime.now - 1.year

    token = FeedlyTokens.get_token
    client = Feedlr::Client.new(oauth_access_token: token)

    sources = FeedlySource.where(enabled: true).order(:updated_at)

    sources.each do |feedly_source|
      begin
        puts "parsing source > #{feedly_source.title}"
        response = client.stream_entries_contents(feedly_source.feed_id, count: 100)

        raise if response.errorCode && response.errorCode == 503
      rescue
        token = FeedlyTokens.get_token(token)

        if token.nil?
          puts "api requests limit reached for all tokens"
          break
        else
          puts "swapped api token to #{token}"
          client = Feedlr::Client.new(oauth_access_token: token)
          retry
        end
      end

      articles = response.items
      next if articles.blank?

      articles.each do |article|
        article_content = article.content.try(:content)
        article_content = article.summary.try(:content) if article_content.blank?
        next if article_content.blank?

        article_date = Time.at(article.published/1000)
        next if article_date < prev_year

        unless FeedlyArticle.exists?(feedly_id: article.id)
          feedly_article = feedly_source.feedly_articles.create(feedly_id: article.id, content: article_content,
                                                                lead_image: article.visual.try(:url),
                                                                author_name: article.author, title: article.title,
                                                                publish_date: article_date, url: article.originId,
                                                                source_url: article.origin.try(:htmlUrl), logo: feedly_source.icon_url)
          puts "created feedly article #{article.title}"
        end
      end
    end
  end
end