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

FactoryGirl.define do
  factory :feedly_source do
    
  end

end
