module VideosHelper

	def show_video(yt_client, video)
		return raw yt_client.video_by(video.youtube_id).embed_html_with_width(350)
	end 

	def show_large_video(yt_client, video)
		return raw yt_client.video_by(video.youtube_id).embed_html_with_width(700)
	end 


end
