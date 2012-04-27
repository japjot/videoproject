class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter 

  has_many :authentications, :dependent => :destroy 
  has_many :invites 
  has_many :videos, :dependent => :destroy 

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :invites_left 



	def full_name 
		return self.first_name + ' ' + self.last_name 
	end

end
