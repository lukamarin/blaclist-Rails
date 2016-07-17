set :output, { :error => '/var/www/production-blaclist/shared/log/cron.log', :standard => nil }

every 1.day do
  rake 'feedly_articles:update'
end

every 1.days do
  rake 'feedly_sources:update'
end