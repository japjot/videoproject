class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :name
      t.text :summary
      t.text :source
      t.text :url
      t.text :location

      t.timestamps
    end
    add_index :videos, [:user_id, :created_at]
  end
end
