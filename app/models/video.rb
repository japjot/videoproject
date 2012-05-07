class Video < ActiveRecord::Base
	acts_as_voteable
	acts_as_commentable
	
	attr_accessible :name, :summary, :source, :url, :location

	validates :user_id, presence: true
	validates :duration, presence: true 
	validates_inclusion_of :duration, :in => 0..60, :message => "Video must be shorter than 60 seconds"
	validates_format_of :url, :with => /^(http:\/\/)?(m\.)?(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:(?:\S(?!http))+)?$/,
														:message => 'this is not a valid youtube url'
	validates :youtube_id, presence: true 



	belongs_to :user 

	def show_image
		return "<img src='http://img.youtube.com/vi/#{self.youtube_id}/1.jpg' width='180' height='80' />".html_safe
	end 

end
