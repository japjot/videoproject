class AddLastCheckedFollowersToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :last_checked_followers, :datetime 
  end
end
