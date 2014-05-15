require "bcrypt"
class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :password_confirm, type: String
  field :bio, type: String

has_and_belongs_to_many :users

validates_presence_of :name, :username, :email, :password_digest
validates_length_of :first_name, minimum: 2, maximum:20
validates_length_of :last_name, minimum: 2, maximum:20
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
