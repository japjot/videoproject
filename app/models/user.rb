class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter 

  has_many :authentications
  has_many :invites 

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable 

         # , :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

	has_many :videos, :dependent => :destroy 


	def full_name 
		return self.first_name + ' ' + self.last_name 
	end

end
