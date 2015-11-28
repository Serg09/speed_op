ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '25', # 25, 587
  :domain => 'example.com', # 'example.com'
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => Rails.application.secrets.sendgrid_username,
  :password => Rails.application.secrets.sendgrid_password
}

SendGrid.configure do |config|
  config.dummy_recipient = 'noreply@example.com'
end
