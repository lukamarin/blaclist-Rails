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

class InterestSource < ActiveRecord::Base
  belongs_to :interest
  belongs_to :feedly_source
end
