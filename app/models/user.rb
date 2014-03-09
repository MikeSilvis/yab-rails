class User < ActiveRecord::Base

  def phone_number=(value)
    super(value.to_s.gsub(/\D/, ''))
  end

end
