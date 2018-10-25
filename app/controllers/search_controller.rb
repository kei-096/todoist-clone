class SearchController < ApplicationController

	def index
		if params[:query].present?
			todos = Todo.search(params[:query])
		else
			@todos = Todo.all
		end
	end
end
