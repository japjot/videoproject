class AddVideoIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :video_id, :integer 
  end
end
