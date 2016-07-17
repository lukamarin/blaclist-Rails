# == Schema Information
#
# Table name: interests
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  interest_type :string
#

class Interest < ActiveRecord::Base
  has_many :interest_sources, dependent: :destroy
  has_many :feedly_sources, through: :interest_sources
  
  validates :name, presence: true,
                   uniqueness: true
  validates :interest_type, presence: true,
                            inclusion: { in: %w(user provider) }

  scope :from_users, -> { where(interest_type: 'user') }
  scope :system, -> { where(interest_type: 'provider') }
end
