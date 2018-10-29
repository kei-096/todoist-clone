require 'rails_helper'

RSpec.describe TodosController, type: :controller  do
	let(:user) { User.create(name: "Panda Man", email: "panda@gmail.com", password: "112233") }
	let(:title) {"Go to gym"}
	let(:due_date) {"2018-10-28 18:00"}
	let(:priority) {"2"}
	# let(:todo) { Todo.create(title: title, due_date: due_date, priority: priority, user_id: user.id) }


	describe "Todos" do
		before do
				session[:user_id] = user.id
				Todo.create(title: title, due_date: due_date, priority: priority, user_id: user.id)
			end
		describe "GET /index" do
			it "displays todos" do
				get :index
				expect(response.body).to include("Go to gym")
			end
		end
	end
	# describe "POST #create" do
	# 	context "successfully created a task" do
	# 		before do
	# 			session[:user_id] = user.id
	# 			post :create, params: {title: title, due_date: due_date, priority: priority, user_id: user.id}
	# 		end

	# 		it "creates a todo" do
	# 			expect(Todo.find(0).to eq 
	# 		end			
	# 	end
	# end
end