class Video < ActiveRecord::Base
	acts_as_voteable
	acts_as_commentable
	
	attr_accessible :name, :summary, :source, :url, :location, :user_id, :duration, :is_featured

	# validates :user_id, presence: true
	# validates :duration, presence: true 
	# validates_inclusion_of :duration, :in => 0..60, :message => "Video must be shorter than 60 seconds"
	validates_format_of :url, :with => /^(http:\/\/)?(m\.)?(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:(?:\S(?!http))+)?$/,
														:message => 'this is not a valid youtube url'
	# validates :youtube_id, presence: true 

	# belongs_to :user 
  before_save do |video|
  	puts video.to_yaml
  	@url = video.url
    if(@url.downcase.include? 'youtube.com')
      ##create ways to catch if user is using 
      puts query_string = URI.parse(video.url).query
      puts parameters = Hash[URI.decode_www_form(query_string)]
      puts parameters['v'] # => aNdMiIAlK0g
      video_id = parameters['v']
    elsif (@url.downcase.include? 'y2u.be')
      puts video_id = @url.match(/\.be\/(.+)$/)[1]
      @url = 'http://www.youtube.com/watch?v='+video_id
      video.url = @url 
    elsif (@url.downcase.include? 'youtu.be')
      puts video_id = @url.match(/\.be\/(.+)$/)[1]
      @url = 'http://www.youtube.com/watch?v='+video_id
      video.url = @url
    end
    video.youtube_id = video_id
  end

	def home_page_featured_description
		return self.summary
	end

	def short_name
		return self.name[0,20]
	end


	def featured_short_name
		return self.name[0,30]
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
