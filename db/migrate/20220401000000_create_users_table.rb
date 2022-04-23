class CreateUsersTable < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :email,              null: false
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end

  def down
    drop_table :users
  end
end
