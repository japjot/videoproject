class ContactsController < ApplicationController

	def new 
		@contact = Contact.new 
    respond_to do |format|
      format.html { render :layout => 'blank' } # new.html.erb
      format.json { render json: @contact }
    end
	end

  def create
		@contact = Contact.new(params[:contact])

    #@email_invite = EmailInvite.new(params[:email_invite])

    respond_to do |format|
      if @contact.save
				UserMailer.send_contact_email(@contact).deliver
        format.html { redirect_to contact_path, notice: 'Your email was sent successfully.' }
      end
    end
  end


end
