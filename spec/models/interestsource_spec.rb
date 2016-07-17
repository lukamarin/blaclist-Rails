# == Schema Information
#
# Table name: interestsources
#
#  id               :integer          not null, primary key
#  interest_id      :integer
#  feedly_source_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Interestsource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
