class CommentsController < ApplicationController

	def create
		@video = Video.find(params[:comment][:commentable_id])
		@user_who_commented = current_user
		@comment = Comment.build_from(@video, @user_who_commented.id, "Comment!" )
	end


end
