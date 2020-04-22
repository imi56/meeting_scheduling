class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.references :user_slot, null: false, foreign_key: true
      t.integer :booked_by_id
      t.string :status, default: 'Booked'

      t.timestamps
    end
  end
end
