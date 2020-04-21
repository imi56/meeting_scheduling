class CreateUserSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :user_slots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.date :slot_date, null: false
    end
    add_index :user_slots, [:user_id, :slot_id, :slot_date], unique: true
  end
end
