class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	flash[:success] = 'Welcome to Todoist!'
	  	session[:user_id] = @user.id
	  	redirect_to '/'
	  else
	  	flash[:failure] = 'Invalid email or password.'
	  	redirect_to '/signup'
	  end
	end

	def login
	  @user = User.find_by_email(params[:email])
	  if @user.password == params[:password]
	    give_token
	  else
	    redirect_to home_url
	  end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
