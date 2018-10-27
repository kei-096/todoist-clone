require 'rails_helper'


RSpec.describe Todo, :type => :model do

	let(:todo) { Todo.new }
	let(:user) { User.new }

	context "validation" do
		it { should belong_to(:user) }
	end

	context "#complete?" do
		it "returns false for incomplete todo task" do
			expect { todo.complete? == false }
		end

		it "returns true for completed todo task" do
			todo.complete!
			expect { todo.complete? == true }
		end
	end
end