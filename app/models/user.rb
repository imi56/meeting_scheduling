class User < ApplicationRecord
  validates_presence_of :full_name
  validates :phone, presence: true, uniqueness: true
  validates_numericality_of :phone, message: 'should only contain digits'
  validates_length_of :phone, is: 10, message: 'should be 10 digits long'
end
