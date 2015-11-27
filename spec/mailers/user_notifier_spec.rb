require "rails_helper"

RSpec.describe UserNotifier, type: :mailer do
  describe "signed_up" do
    let(:mail) { UserNotifier.signed_up }

    it "renders the headers" do
      expect(mail.subject).to eq("Signed up")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "verified" do
    let(:mail) { UserNotifier.verified }

    it "renders the headers" do
      expect(mail.subject).to eq("Verified")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "verify" do
    let(:mail) { UserNotifier.verify }

    it "renders the headers" do
      expect(mail.subject).to eq("Verify")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
