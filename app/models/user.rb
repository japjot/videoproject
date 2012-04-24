class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :authentications

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable 

         # , :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

	has_many :videos

	def full_name 
		return self.first_name + ' ' + self.last_name 
	end

end
