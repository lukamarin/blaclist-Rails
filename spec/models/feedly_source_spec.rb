# == Schema Information
#
# Table name: feedly_sources
#
#  id          :integer          not null, primary key
#  feed_id     :string
#  title       :string
#  description :string
#  icon_url    :string
#  enabled     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe FeedlySource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
