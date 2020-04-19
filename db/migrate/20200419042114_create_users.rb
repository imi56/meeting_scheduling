class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :phone, null: false
      t.timestamps
    end
    add_index :users, :phone, unique: true
  end
end
