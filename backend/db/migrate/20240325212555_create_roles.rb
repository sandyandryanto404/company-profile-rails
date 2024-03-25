class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, :options => 'ENGINE=InnoDB'do |t|
      t.string :code, limit: 64, null: false
      t.string :name, limit: 191, null: false
      t.text :description,  null: true
      t.integer :status, :default => 0, :limit => 2
      t.timestamps
    end
    add_index :roles, :code
    add_index :roles, :name
    add_index :roles, :status
    add_index :roles, :created_at
    add_index :roles, :updated_at
  end
end
