class Meeting < ApplicationRecord
  belongs_to :user_slot
  belongs_to :booked_by, class_name: 'User'

  def meeting_json
    self.as_json(
      only: [:id, :status],
      methods: [:booked_by_name, :date, :starts_at, :ends_at]
    )
  end

  private

  def booked_by_name
    booked_by.full_name
  end

  def date
    user_slot.slot_date
  end

  def starts_at
    user_slot.slot.from
  end

  def ends_at
    user_slot.slot.to
  end

end
