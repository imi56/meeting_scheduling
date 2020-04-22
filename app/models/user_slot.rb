class UserSlot < ApplicationRecord
  validates_uniqueness_of :slot_id, scope: [:user_id, :slot_date]
  has_many :user_slots
  belongs_to :user
  belongs_to :slot
end
