class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :users_roles, :options => 'ENGINE=InnoDB', primary_key: %i[user_id role_id] do |t|
      t.bigint :user_id, null: false
      t.bigint :role_id, null: false
    end
    add_index :users_roles, :user_id
    add_index :users_roles, :role_id
    add_foreign_key :users_roles, :users, column: :user_id
    add_foreign_key :users_roles, :roles, column: :role_id
  end
end
