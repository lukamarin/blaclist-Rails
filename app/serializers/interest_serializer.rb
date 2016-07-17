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

class InterestSerializer < ActiveModel::Serializer
  attributes :id, :title, :articles

  def title
    object.name
  end

  def articles
    FeedlyArticlesFinder.serialized_collection(FeedlyArticleSerializer, interests_ids: object.id, params: { page: 1, per_page: 5 })
  end
end
