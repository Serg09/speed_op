require 'roo'

class Envelope < ActiveRecord::Base

  def envelope_mailer
    xlsx = Roo::Spreadsheet.open('app/assets/files/Emails.xlsx')
    # xlsx = Roo::Excelx.new('app/assets/files/Emails.xlsx')
    # ex = Excel.new("app/assets/files/Emails.xlsx")
    # xlsx.info
    xlsx.default_sheet = xlsx.sheets[1] #Mention the sheet number
    1.upto(1000) do |line| #start and end of row
      name = xlsx.cell(line,`A`)
      email = xlsx.cell(line,`B`)
      @envelope = Envelope.create(:name => name,:email => email)
    end
  end
  end
