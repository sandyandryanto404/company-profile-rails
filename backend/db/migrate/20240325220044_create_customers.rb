class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, :options => 'ENGINE=InnoDB' do |t|
      t.string :image, limit: 191, null: true
      t.string :name, limit: 191, null: false
      t.string :phone, limit: 191, null: false
      t.string :email, limit: 191, null: false
      t.text :address,  null: true
      t.integer :sort, :default => 0
      t.integer :status, :default => 0, :limit => 2
      t.timestamps
    end
    add_index :customers, :image
    add_index :customers, :name
    add_index :customers, :phone
    add_index :customers, :sort
    add_index :customers, :status
    add_index :customers, :created_at
    add_index :customers, :updated_at
  end
end
