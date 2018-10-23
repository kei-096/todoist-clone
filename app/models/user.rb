require 'bcrypt'

class User < ApplicationRecord
	include BCrypt
	has_secure_password
	has_many :todos
end
