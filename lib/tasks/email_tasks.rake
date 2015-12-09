desc 'send digest email'
 task send_digest_email: :environment do
   Envelope.find_each do |envelope|
     EnvelopeMailer.digest_email_update(envelope).deliver_now
   end
end


# desc 'send digest email'
# task send_digest_email: :environment do
#   User.find_each do |person|
#     UserMailer.digest_email_update(person).deliver_now
#   end
# end
