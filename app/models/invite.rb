class Invite < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :body, :title, :subject
	belongs_to :user 
end
