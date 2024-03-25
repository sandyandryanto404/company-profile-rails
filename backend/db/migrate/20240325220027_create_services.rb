class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services, :options => 'ENGINE=InnoDB' do |t|
      t.string :icon, limit: 191, null: true
      t.string :title, limit: 191, null: true
      t.text :description,  null: true
      t.integer :sort, :default => 0
      t.integer :status, :default => 0, :limit => 2
      t.timestamps
    end
    add_index :services, :icon
    add_index :services, :title
    add_index :services, :sort
    add_index :services, :status
    add_index :services, :created_at
    add_index :services, :updated_at
  end
end
