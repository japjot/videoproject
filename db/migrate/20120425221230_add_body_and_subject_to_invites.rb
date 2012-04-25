class AddBodyAndSubjectToInvites < ActiveRecord::Migration
  def change
  	add_column :invites, :subject, :string
  	add_column :invites, :body, :string
  end
end
