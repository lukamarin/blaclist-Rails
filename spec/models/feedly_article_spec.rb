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

require 'rails_helper'

RSpec.describe FeedlyArticle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
