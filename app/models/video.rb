class Video < ActiveRecord::Base
	attr_accessible :name, :summary, :source, :url, :location

	validates :user_id, presence: true

	belongs_to :user, :dependent => :destroy 
end
