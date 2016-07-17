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

class FeedlySource < ActiveRecord::Base
  validates :feed_id, presence: true,
                      uniqueness: true

  has_many :feedly_articles, dependent: :destroy
  has_many :interest_sources, dependent: :destroy
  has_many :interests, through: :interest_sources
end
