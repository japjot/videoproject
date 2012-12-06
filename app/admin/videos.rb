ActiveAdmin.register Video do

	# before_save do |video|
 #  	puts video.to_yaml
 #  	@url = video.url
 #    if(@url.downcase.include? 'youtube.com')
 #      ##create ways to catch if user is using 
 #      puts query_string = URI.parse(video.url).query
 #      puts parameters = Hash[URI.decode_www_form(query_string)]
 #      puts parameters['v'] # => aNdMiIAlK0g
 #      video_id = parameters['v']
 #    elsif (@url.downcase.include? 'y2u.be')
 #      puts video_id = @url.match(/\.be\/(.+)$/)[1]
 #      @url = 'http://www.youtube.com/watch?v='+video_id
 #      video.url = @url 
 #    elsif (@url.downcase.include? 'youtu.be')
 #      puts video_id = @url.match(/\.be\/(.+)$/)[1]
 #      @url = 'http://www.youtube.com/watch?v='+video_id
 #      video.url = @url
 #    end
 #    video.youtube_id = video_id
 #  end
  
end
