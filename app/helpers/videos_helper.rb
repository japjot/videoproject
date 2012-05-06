module VideosHelper

	def show_video(yt_client, video)
		@embed_video = '<object width="180" height="101">'
		@embed_video = @embed_video + '<param value="http://www.youtube.com/v/'+video.youtube_id+'&feature=youtube_gdata_player" name="movie">'
		@embed_video = @embed_video + '<param value="transparent" name="wode">'
		@embed_video = @embed_video + '<embed width="175" height="101" wmode="transparent" type="application/x-shockwave-flash" src="http://www.youtube.com/v/'+video.youtube_id+'&feature=youtube_gdata_player">'
		@embed_video = @embed_video + '</object>'
		return @embed_video.html_safe 
	end 

	def show_large_video(yt_client, video)
		return raw yt_client.video_by(video.youtube_id).embed_html_with_width(700)
	end 


end
