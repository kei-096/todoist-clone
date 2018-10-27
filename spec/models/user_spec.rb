require 'rails_helper'

# describe User do 

# 	Given(:user) { User.new }
# 	Given(:email) { "test@gmail.com" }
# 	Given(:name) { "Panda Man" }

# 	describe "validates email uniquness" do
# 		When (:output) { User.new(name, email) }
# 		Then { expect(output).not_to raise_error }
# 	end
# end

RSpec.describe User, :type => :model do

	let(:user) { User.new }
	let(:email) { "test@gmail.com" }
	let(:name) { "Panda Man" }
	let(:todos) {[Todo.new("Study"), Todo.new('Workout')]}

	context "validation" do
		it { is_expected.to validate_presence_of(:name)}
		it { is_expected.to validate_uniqueness_of(:email) }
		it { is_expected.to validate_presence_of(:email) }
		it { should have_many(:todos) }
	end
end