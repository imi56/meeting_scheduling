class User < ApplicationRecord
  before_validation :generate_uuid, on: :create

  validates_presence_of :full_name, :uuid
  validates :phone, presence: true, uniqueness: true, unless: lambda {|u| u.guest?}
  validates_numericality_of :phone, message: 'should only contain digits', unless: lambda {|u| u.guest?}
  validates_length_of :phone, is: 10, message: 'should be 10 digits long', unless: lambda {|u| u.guest?}

  private

  def generate_uuid
    self.uuid = SecureRandom.urlsafe_base64(12, false)
  end

end
