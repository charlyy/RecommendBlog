require "bcrypt"
class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :bio, type: String

attr_accessor :password_confirm


has_and_belongs_to_many :users
has_many :posts
has_many :comments

validates_presence_of :first_name, :username, :email
validates_length_of :first_name, minimum: 2 
validates_length_of :last_name, minimum: 2
# validates_length_of :password, minimum: 4
# validates_length_of :password_confirm, minimum: 4
validates_length_of :username, minimum: 4, maximum: 14
validates_length_of :bio, maximum: 100
validates_uniqueness_of :email, :username
validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i



def password
	@password
end

def password=(new_password)
	@password = new_password
	self.password_digest = BCrypt::Password.create(new_password)
end


def authenticate(test_password)
	if BCrypt::Password.new(self.password_digest) == test_password
		self
	else
		false
  end
end
end
