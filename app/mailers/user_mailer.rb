class UserMailer < ActionMailer::Base
  default from: "info@gloopt.com"

  def add_to_waitlist(waiting_list)
  	@waiting_list = waiting_list 
  	mail(:to => @waiting_list.email, :subject => "Added to the Gloopt Waitlist" )
	end 

  def add_to_beta(waiting_list)
  	@waiting_list = waiting_list 
  	mail(:to => @waiting_list.email, :subject => "Gloopt is ready for you" )
	end 

	def send_invitation(user, email_invite)
		@email_invite = email_invite
		@user = user
		mail(:to => @email_invite.email, :from => @user.email, :subject => @email_invite.subject)
	end 


end
