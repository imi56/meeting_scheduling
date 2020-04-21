SlotType.create!(name: :hourly)

Slot.insert_all!([
  {from: '08 AM', to: '09 AM', slot_type_id: 1},
  {from: '09 AM', to: '10 AM', slot_type_id: 1},
  {from: '10 AM', to: '11 AM', slot_type_id: 1},
  {from: '11 AM', to: '12 PM', slot_type_id: 1},
  {from: '12 PM', to: '01 PM', slot_type_id: 1},
  {from: '01 PM', to: '02 PM', slot_type_id: 1},
  {from: '02 PM', to: '03 PM', slot_type_id: 1},
  {from: '03 PM', to: '04 PM', slot_type_id: 1},
  {from: '04 PM', to: '05 PM', slot_type_id: 1},
  {from: '05 PM', to: '06 PM', slot_type_id: 1},
  {from: '06 PM', to: '07 PM', slot_type_id: 1},
  {from: '07 PM', to: '08 PM', slot_type_id: 1},
  {from: '08 PM', to: '09 PM', slot_type_id: 1},
  {from: '09 PM', to: '10 PM', slot_type_id: 1},
  {from: '10 PM', to: '11 PM', slot_type_id: 1},
  {from: '11 PM', to: '12 AM', slot_type_id: 1},
  {from: '12 AM', to: '01 AM', slot_type_id: 1},
  {from: '02 AM', to: '03 AM', slot_type_id: 1},
  {from: '03 AM', to: '04 AM', slot_type_id: 1},
  {from: '04 AM', to: '05 AM', slot_type_id: 1},
  {from: '05 AM', to: '06 AM', slot_type_id: 1},
  {from: '06 AM', to: '07 AM', slot_type_id: 1},
  {from: '07 AM', to: '08 AM', slot_type_id: 1}
])