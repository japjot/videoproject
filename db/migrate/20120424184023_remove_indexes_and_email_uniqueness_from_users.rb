class RemoveIndexesAndEmailUniquenessFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :email, :string
  	remove_column :users, :encrypted_password, :string 
    add_column :users, :email, 							:string
    add_column :users, :encrypted_password, :string
  end

  def down
  	remove_column :users, :email, :string
  	remove_column :users, :encrypted_password, :string 
    add_column :users, :email, 							:string, :null => false, :default => ""
    add_column :users, :encrypted_password, :string, :null => false, :default => ""
  end
end
