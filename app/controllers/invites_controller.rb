class InvitesController < ApplicationController

  before_filter :user_signed_in, :only => [:create, :edit, :new, :index]


  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all

    if current_user
      @li_client = LinkedIn::Client.new
      @li_client.authorize_from_access(current_user.authentications.first.token, current_user.authentications.first.secret)
    end 


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invites }
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = Invite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/new
  # GET /invites/new.json
  def new
    @invite = Invite.new

    @li_client = LinkedIn::Client.new
    @li_client.authorize_from_access(current_user.authentications.first.token, current_user.authentications.first.secret)
    @friend = @li_client.profile(:id => params[:linkedin_id])

    @invite_subject = 'Want an invite for Gloopt?'
    @invite_body = 'Hey ' + @friend.first_name + ', I just got a few invitations and I thought you might want one.  

Just visit '+beta_url+'    

Best,  

' + current_user.first_name 
#need to make these into constants or methods and store them somewhere.  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(params[:invite])

    respond_to do |format|
      if @invite.save
        @li_client = LinkedIn::Client.new
        @li_client.authorize_from_access(current_user.authentications.first.token, current_user.authentications.first.secret)
        @message_path = "/people/" + @invite.linkedin_id 

        @li_client.send_message( :recipients => {:values => [:person => {:_path => @message_path } ]}  , :subject => @invite.subject,:body => @invite.body  ) 
        @user = current_user
        @invites_left = @user.invites_left 
        @user.invites_left = @invites_left -1 
        @user.save 
        format.html { redirect_to invites_path, notice: 'Invite was sent successfully.' }
        format.json { render json: invites_path, status: :created, location: @invite }
      else
        format.html { render action: "new" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invites/1
  # PUT /invites/1.json
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to invites_url }
      format.json { head :no_content }
    end
  end


  private
    def user_signed_in
      redirect_to root_path if !user_signed_in?
    end


end
