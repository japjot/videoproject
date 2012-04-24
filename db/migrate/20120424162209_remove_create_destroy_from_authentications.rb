class RemoveCreateDestroyFromAuthentications < ActiveRecord::Migration
  def up
  	remove_column :authentications, :create,  :boolean 
  	remove_column :authentications,  :destroy, :boolean 
  	remove_column :authentications,  :index,  :boolean 
  end

  def down
  	add_column :authentications, :create,  :boolean 
  	add_column :authentications, :destroy, :boolean 
  	add_column :authentications, :index,  :boolean 
  end
end
