class CreateUserVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :users_verifications, :options => 'ENGINE=InnoDB' do |t|
      t.bigint :user_id, null: false
      t.string :token, limit: 191, null: false
      t.integer :status, :default => 0, :limit => 2
      t.datetime :expired_at, null: false
      t.timestamps
    end
    add_index :users_verifications, :user_id
    add_index :users_verifications, :token
    add_index :users_verifications, :status
    add_index :users_verifications, :expired_at
    add_index :users_verifications, :created_at
    add_index :users_verifications, :updated_at
    add_foreign_key :users_verifications, :users, column: :user_id
  end
end
