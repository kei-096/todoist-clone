require 'bcrypt'

class User < ApplicationRecord
	include BCrypt
	has_secure_password
	has_many :todos
	validates :email, uniquness: true
	validates :name, :email, presence: true

	def self.create_with_auth_and_hash(authentication, auth_hash)
		user = self.create!(
			name: auth_hash['info']['name'],
			email: auth_hash['info']['email'],
			password: SecureRandom.hex(10)
		)
		# user.authentications << authentication
		return user
	end

	def google_token
		x = self.authentications.find_by(provider: 'google_oauth2')
		return x.token unless x.nil?
	end
end
