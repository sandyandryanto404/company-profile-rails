class CreatePasswordResets < ActiveRecord::Migration[7.0]
 def change
    create_table :users_password_resets, :options => 'ENGINE=InnoDB' do |t|
      t.string :email, limit: 64, null: false
      t.string :token, limit: 191, null: false
      t.timestamps
    end
    add_index :users_password_resets, :email
    add_index :users_password_resets, :token
    add_index :users_password_resets, :created_at
    add_index :users_password_resets, :updated_at
  end
end
