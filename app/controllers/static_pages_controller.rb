class StaticPagesController < ApplicationController

  def home
    @yt_client = YouTubeIt::Client.new(:dev_key => ENV["YOUTUBE_DEV_KEY"])
		@videos = Video.order("RANDOM()").limit 6

    @featured_video = Video.where(["is_featured = ?", true]).order("RANDOM()").first
    @featured_video ||= Video.order("RANDOM()").limit(1).first

    respond_to do |format|
      format.html { render :layout => "blank" } # home.html.erb
    end
  end

  def about
    respond_to do |format|
      format.html  { render :layout => "blank" } 
    end
  end


end
