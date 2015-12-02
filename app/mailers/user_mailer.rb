class UserMailer < ActionMailer::Base
  def digest_email_update(user)
    @user = user
      # attachments['Speed_OP_*'.last] = File.read('app/assets/files')
      mail(:to => 'sergey_skumatov@hotmail.com', :bcc => @user.email, :subject => "test mailing email", :from => "speedopdavinci@gmail.com") do
        # format.text(:content_type => "text/plain", :charset => "UTF-8", :content_transfer_encoding => "7bit")
    end
  end
end
