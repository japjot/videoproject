class Video < ActiveRecord::Base
	attr_accessible :name, :summary, :source, :url, :location

	validates :user_id, presence: true
	validates :duration, presence: true 
	validates_inclusion_of :duration, :in => 0..60, :message => "Video must be shorter than 60 seconds"


	belongs_to :user 


end
