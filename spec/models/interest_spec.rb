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

require 'rails_helper'

RSpec.describe Interest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
