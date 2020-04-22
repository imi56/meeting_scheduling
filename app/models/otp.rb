class Otp < ApplicationRecord

  #region Validations
  validates_presence_of :phone, message: 'cannot be blank'
  validates_numericality_of :phone, message: 'should only contain digits'
  validates_length_of :phone, :is => 10, :message => 'should be 10 digits long'
  validates_presence_of :password, message: 'cannot be blank'
  #endregion

  module Constants
    EXPIRY_DURATION = 10.minutes
    OTP_SMS_TEMPLATE = 'CompFeed OTP is : %s'
  end

#region Class methods
  def self.generate_otp(otp)
    new_otp = rand(0..9999).to_i.to_s.rjust(4, '0')
    if otp.blank?
      new_otp
    else
      otp.expiry > Time.now ? otp.password : new_otp
    end

  end

  def self.upsert_otp(phone, expiry)
    otp = Otp.where(phone: phone).first

    if otp.blank?
      return Otp.new(phone: phone, password: self.generate_otp(otp), expiry: expiry)
    else
      otp.password = self.generate_otp(otp)
      otp.expiry = expiry
      return otp
    end
  end

  def self.verify(phone, verifying_otp)
    otp = Otp.where(phone: phone).where('expiry > ?', Time.now).first
    return false if otp.blank?
    otp.password.eql?(verifying_otp) ? true : false
  end

  def otp_json
    self.as_json(
      only: [:password]
    )
  end

#endregion
end
