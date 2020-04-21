class Slot < ApplicationRecord
  belongs_to :slot_type

  def slot_json
    self.as_json(
      except: [:slot_type_id]
    )
  end
end
