# == Schema Information
#
# Table name: feedly_articles
#
#  id               :integer          not null, primary key
#  author_name      :string
#  content          :string
#  lead_image       :string
#  url              :string
#  title            :string
#  logo             :string
#  source_url       :string
#  publish_date     :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  feedly_source_id :integer          not null
#  feedly_id        :string
#

class FeedlyArticleSerializer < ActiveModel::Serializer
  attributes :id, :author_name, :content, :lead_image, :url, :title, :logo,
             :source_url, :publish_date
end
