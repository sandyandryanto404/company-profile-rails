class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, :options => 'ENGINE=InnoDB' do |t|
      t.string :image, limit: 191, null: true
      t.string :first_name, limit: 64, null: true
      t.string :last_name, limit: 191, null: true
      t.string :gender, limit: 2, null: true
      t.string :country, limit: 64, null: true
      t.string :province, limit: 191, null: true
      t.string :postal_code, limit: 191, null: true
      t.string :birth_place, limit: 191, null: true
      t.date :birth_date, null: true
      t.string :twitter, limit: 191, null: true
      t.string :facebook, limit: 191, null: true
      t.string :instagram, limit: 191, null: true
      t.text :address,  null: true
      t.text :about_me,  null: true
      t.string :username, limit: 191, null: false
      t.string :email, limit: 191, null: false
      t.string :phone, limit: 20, null: true
      t.string :password_digest
      t.integer :status, :default => 0, :limit => 2
      t.timestamps
    end
    add_index :users, :image
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :gender
    add_index :users, :country
    add_index :users, :province
    add_index :users, :postal_code
    add_index :users, :birth_place
    add_index :users, :twitter
    add_index :users, :facebook
    add_index :users, :instagram
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :phone, unique: true
    add_index :users, :password_digest
    add_index :users, :status
    add_index :users, :created_at
    add_index :users, :updated_at
  end
end
