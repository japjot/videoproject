class Authentication < ActiveRecord::Base

attr_accessible :user_id, :token, :secret, :uid, :provider

	belongs_to :user 

end
