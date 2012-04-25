class AddInvitesLeftToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :invites_left, :integer 
  end
end
