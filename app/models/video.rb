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

	def home_page_featured_description
		return self.summary
	end

	def youtube_link
		return self.url 
	end

	def self.search(search)
		if search
	    	find(:all, :conditions => ['name ILIKE ? or summary ILIKE ?', "%#{search}%", "%#{search}%" ])
		else
			find(:all)
			self.order("id DESC")
		end
	end

	def show_image(width = 180 , height = 80) 
		v =  "<img src='http://img.youtube.com/vi/#{self.youtube_id}/1.jpg' width='"+ width.to_s + "' height='"+height.to_s+"' />"
		return v.html_safe
	end

	# def show_image(width = 180 , height = 80) 
	# 	return "<img src='http://img.youtube.com/vi/#{self.youtube_id}/1.jpg' width='"+ width.to_s + "' height='"+ height.to_s + "' />".html_safe
	# end 


end
