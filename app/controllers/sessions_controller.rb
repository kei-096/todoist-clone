class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:failure] = 'Invalid password or email'
			redirect '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
