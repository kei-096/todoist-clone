class TodosController < ApplicationController
	before_action :authorize

	def index
		@todos = Todo.where(user_id: current_user.id)
	end

	def new	
		@todo = Todo.new
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

	def destroy
		todo = Todo.find(params[:id])
		todo.destroy
		redirect_to todos_path
	end

	private
	def todo_params
		params.require(:todo).permit(:title, :due_date, :priority)
	end
end
