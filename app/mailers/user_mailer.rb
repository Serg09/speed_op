class WelcomeMailer < ActionMailer::Base
  default :from => 'no-reply@example.com',
    :subject => 'An email sent via SendGrid with substitutions'

  def confirmation_email
    category 'SendGridRocks'
    mail :to => 'speedopdavinci@gmail.com'
  end
end
