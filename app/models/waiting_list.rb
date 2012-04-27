class WaitingList < ActiveRecord::Base

before_create :create_defaults

	def create_defaults 
		self.set_email_sent_to_zero
	end

  def set_email_sent_at_to_now
    self.email_sent_at = Time.now
  end

  def set_email_sent_to_zero
  	self.email_sent = 0
  end

  def set_email_sent_to_true
  	self.email_sent = 1
  end


end
