class CreateSlotTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_types do |t|
      t.string :name, null: false
    end
  end
end
