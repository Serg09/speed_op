class User < ActiveRecord::Base
  has_secure_password(validations: false)

  validates_confirmation_of :password, if: ->(user) {
      !user.omniauth? && user.password.present?
    }
  validates_presence_of :password, if: ->(user) {
      !user.omniauth?
    }, on: :create
  validates_presence_of :password_confirmation, if: ->(user) {
      !user.omniauth? && user.password.present?
    }

  validates_uniqueness_of :email

  validates_length_of :password, minimum: 8


  def needs_verification!
    self.update_attributes!(
      token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver_now
  end

# Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
