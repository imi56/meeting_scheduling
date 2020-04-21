class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :phone
      t.string :uuid, null: false
      t.boolean :guest, default: false
      t.timestamps
    end
    add_index :users, :phone, unique: true
    add_index :users, :uuid, unique: true
  end
end
