class EmailInvitesController < ApplicationController

  # GET /email_invites/new
  # GET /email_invites/new.json
  def new
    @email_invite = EmailInvite.new

      @invite_subject = 'Want an invite for Gloopt?'
      @invite_body = 'Hey,

I just got a few invitations and I thought you might want one.  

Just visit '+beta_url+'    

Best,  

' + current_user.first_name 


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_invite }
    end
  end


  # POST /email_invites
  # POST /email_invites.json
  def create

		@email_invite = current_user.email_invites.build(params[:email_invite])

    #@email_invite = EmailInvite.new(params[:email_invite])

    respond_to do |format|
      if @email_invite.save

				UserMailer.send_invitation(current_user, @email_invite).deliver

	      @user = current_user
	      @invites_left = @user.invites_left 
	      @user.invites_left = @invites_left - 1
	      @user.save(:validate => false) 

        format.html { redirect_to invites_path, notice: 'Your email was sent successfully.' }
        format.json { render json: invites_path, status: :created, location: @email_invite }
      else
        format.html { render action: "new" }
        format.json { render json: @email_invite.errors, status: :unprocessable_entity }
      end
    end
  end

end
