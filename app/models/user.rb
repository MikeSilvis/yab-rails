class User < ActiveRecord::Base
  after_commit :send_welcome_text

  def phone_number=(value)
    super(value.to_s.gsub(/\D/, ''))
  end

  def something
    I18n.t(:welcome_message)
  end

  private

  def send_welcome_text
    Yab::Sms.new.text("+#{phone_number}", "Some Intro")
  end

end
