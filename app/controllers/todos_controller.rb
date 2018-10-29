class TodosController < ApplicationController
	before_action :authorize

	def index
		@todos = Todo.where(user_id: current_user.id)
		# render :partial => "todo.html.erb", :collection => Todo.where(user_id: current_user.id)
		@todo = Todo.new
	end

	def new	
		@todo = Todo.new
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def ajax_find
		byebug
		@todo = Todo.find(params[:id])
		# This is new AJAX
		# respond_to do |format|
		# 		format.js
		# 		format.html
		# end

		#This is traditional AJAX
		render json: @todo
	end

	def create
		@todo = current_user.todos.new(todo_params)

		if @todo.save
			redirect_to todos_path
		else
			redirect_to new_todo_path
		end
	end

	def edit
		@todo = Todo.find(params[:id])
		render 'todos/edit'
	end

	def update
		todo = Todo.find(params[:id])
		todo.update(todo_params)
		redirect_to todos_path
	end

	def add_image
		@todo = Todo.find(params['id'])
		@todo.update(image_params)
		redirect_to todos_path
	end

	def destroy
		todo = Todo.find(params[:id])
		todo.destroy
		redirect_to todos_path
	end

	def search
		if params[:query].present?
			@todos = Todo.search_name(params[:query])
			@todo = Todo.new
			respond_to do |format|
				format.js
				format.html
			end
		else
			@todos = Todo.where(user_id: current_user.id )
		end
	end

	private
	def todo_params
		params.require(:todo).permit(:title, :due_date, :priority)
	end

	def image_params
		params.require(:todo).permit(:id, {images: []})
	end
end
