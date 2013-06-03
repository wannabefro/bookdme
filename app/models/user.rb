class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  ROLES = %w[User Act]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role
  # attr_accessible :title, :body
  validates_presence_of :first_name, :last_name, :email
  validates :email, :email => true
  validates :role, :presence => true, :inclusion => { :in => ROLES }

end
