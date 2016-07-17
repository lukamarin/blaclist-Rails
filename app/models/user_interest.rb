# == Schema Information
#
# Table name: user_interests
#
#  id          :integer          not null, primary key
#  interest_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest
end
