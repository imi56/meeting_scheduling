class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.string :from, null: false
      t.string :to, null: false
      t.references :slot_type, null: false, foreign_key: true
    end
  end
end
