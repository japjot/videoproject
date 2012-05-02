class UsersController < ApplicationController

  before_filter :user_not_signed_in, :only => [:create, :new]


  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/email 
  def email
    @user = current_user 
  end

  def update_email 
    @user = current_user 

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_videos_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "email" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end 

  # GET /users/1/edit
  def edit
    @user = current_user 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.last_checked_followers = DateTime.current 

    respond_to do |format|
      if @user.save ##and user is over 60 seconds in duration 
        format.html { redirect_to 'users#thank_you', notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user], :validate => false)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow_user 
    @current_user = current_user 
    @followed_user = User.find params[:user][:user_id] 

    current_user.follow(@followed_user)

    redirect_to beta_path  
  end 


  def unfollow_user 
    @current_user = current_user 
    @unfollowed_user = User.find params[:user][:user_id] 

    current_user.stop_following(@unfollowed_user)


    redirect_to beta_path
  end

  private
    def user_not_signed_in
      redirect_to users_videos_path if user_signed_in?
    end


end
