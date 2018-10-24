class TodosController < ApplicationController
	before_action :authorize

	def index
		@todos = Todo.where(user_id: current_user.id)
	end

	def new	
		@todo = Todo.new
	end

	
end
