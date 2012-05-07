class CreateEmailInvites < ActiveRecord::Migration
  def change
    create_table :email_invites do |t|
      t.string :email
      t.string :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
