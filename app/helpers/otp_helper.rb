module OtpHelper
  def upsert_otp(phone = nil)
    otp = Otp.upsert_otp(phone, Time.now + Otp::Constants::EXPIRY_DURATION)
    if otp.valid?
      otp.save!
      data = Rails.env.production? ? { password: '' } : { password: otp.password }
      render_success(data, ['OTP sent successfully'], 201)
    else
      render_error('error', otp.errors.full_messages, :unprocessable_entity)
    end
  end

  def otp_verified?(phone, otp)
    is_valid = Otp.verify(phone, otp)
    delete_otp(phone) if is_valid
    is_valid
  end

  def delete_otp(phone)
    Otp.find_by(phone: phone).destroy!
  end

end