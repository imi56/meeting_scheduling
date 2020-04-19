class CreateOtps < ActiveRecord::Migration[6.0]
  def change
    create_table :otps do |t|
      t.string :phone, null: false
      t.string :password, null: false
      t.datetime :expiry

      t.timestamps
    end
  end
end
