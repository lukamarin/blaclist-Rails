# == Schema Information
#
# Table name: interest_sources
#
#  id               :integer          not null, primary key
#  interest_id      :integer
#  feedly_source_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :interest_source do
    
  end

end
