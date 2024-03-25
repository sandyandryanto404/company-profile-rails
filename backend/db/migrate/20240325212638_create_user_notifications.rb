class CreateUserNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :users_notifications, :options => 'ENGINE=InnoDB' do |t|
      t.bigint :user_id, null: false
      t.string :subject, limit: 191, null: false
      t.string :description, limit: 255, null: false
      t.text :content, limit: 4294967295, null: true
      t.integer :status, :default => 0, :limit => 2
      t.datetime :expired_at, null: false
      t.timestamps
    end
    add_index :users_notifications, :user_id
    add_index :users_notifications, :subject
    add_index :users_notifications, :description
    add_index :users_notifications, :expired_at
    add_index :users_notifications, :created_at
    add_index :users_notifications, :updated_at
    add_foreign_key :users_notifications, :users, column: :user_id
  end
end
