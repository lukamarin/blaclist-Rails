# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string           not null
#  crypted_password             :string
#  salt                         :string
#  created_at                   :datetime
#  updated_at                   :datetime
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  access_token                 :string
#  is_admin                     :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :user_interests
  has_many :interests, -> { uniq }, through: :user_interests

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$\z/i }
  validates :password, length: { minimum: 6 }, if: -> { (new_record? || changes["password"]) && !is_admin }

  def generate_access_token!
    self.access_token = loop do
      token = SecureRandom.urlsafe_base64(32)
      break token unless User.exists?(access_token: token)
    end
    save!
  end
end
