class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.string :email, default: "", null: false
      t.string :api_token

      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.string :confirmation_token
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :confirmed_at
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.integer  :sign_in_count, default: 0, null: false
      t.references :account

      t.timestamps
    end
  end
end
