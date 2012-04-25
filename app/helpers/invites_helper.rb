module InvitesHelper

	def name_and_headline(friend)
		return friend.first_name + ' ' + friend.last_name + ', ' + friend.headline 
	end
end
