class CreateWaitingLists < ActiveRecord::Migration
  def change
    create_table :waiting_lists do |t|
      t.string :email
      t.boolean :email_sent
      t.datetime :email_sent_at

      t.timestamps
    end
  end
end
