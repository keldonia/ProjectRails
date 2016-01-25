class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, :default => 'Idunno'
    remove_column :users, :name, :string
    remove_column :users, :email, :string

    add_index :users, :username, unique: true
  end
end
