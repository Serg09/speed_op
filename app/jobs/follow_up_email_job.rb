class FollowUpEmailJob < ActiveJob::Base
  @queue_as = :user

  def self.perform(email)
    @user.email = email
    UserMailer.follow_up_email(email).deliver_now
  end
end
