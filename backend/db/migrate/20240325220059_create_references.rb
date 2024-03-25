class CreateReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :references, :options => 'ENGINE=InnoDB' do |t|
      t.string :slug, limit: 255, null: false
      t.string :name, limit: 255, null: false
      t.text :description,  null: true
      t.integer :type, :default => 0
      t.integer :status, :default => 0, :limit => 2
      t.timestamps
    end
    add_index :references, :slug
    add_index :references, :name
    add_index :references, :type
    add_index :references, :status
    add_index :references, :created_at
    add_index :references, :updated_at
  end
end
