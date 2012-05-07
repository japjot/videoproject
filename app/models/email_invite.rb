class EmailInvite < ActiveRecord::Base

	belongs_to :user 


validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

end
