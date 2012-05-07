class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter 
  acts_as_follower
  acts_as_followable

  has_many :authentications, :dependent => :destroy 
  has_many :invites 
  has_many :videos, :dependent => :destroy 
  has_many :comments 
  has_many :email_invites

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :invites_left 



	def full_name 
		return self.first_name + ' ' + self.last_name 
	end

end
