class RemoveSourceFromVideos < ActiveRecord::Migration
  def up
  	add_column	:videos,	:youtube_id,	:string
  	remove_column	:videos, 	:location  
  	remove_column :videos, 	:source
  end

  def down
  	remove_column	:videos,	:youtube_id
  	add_column	:videos, 	:location, :text 
  	add_column :videos, 	:source, :text
  end
end
