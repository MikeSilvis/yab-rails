class Yab::Sms
  ACCOUNT_SID = 'ACb2066eb59465c67ace8473515c3c7f53'
  PHONE_NUMBER = '+18149330175'
  AUTH_TOKEN = '50cec3e05b120366ed41c558e64929be'

  def text(to, body)
    client.account.messsages.create({
      :from => PHONE_NUMBER,
      :to => to,
      :body => body
    })
  end

  private

  def client
    @client ||= Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

end
