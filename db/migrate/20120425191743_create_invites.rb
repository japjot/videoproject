class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :first_name
      t.string :last_name
      t.string :linkedin_id
      t.string :title

      t.timestamps
    end
  end
end
