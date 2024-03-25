class CreateLoginAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :login_attempts, :options => 'ENGINE=InnoDB' do |t|
      t.string :ip_address
      t.string :login
      t.timestamps
    end
    add_index :login_attempts, :ip_address
    add_index :login_attempts, :login
  end
end
