require 'rails_helper'

RSpec.feature "User registration", :type => :feature do
	scenario "A new user signs up" do
		visit signup_path

		fill_in "user_name", :with => "Panda Man"
		fill_in "user_email", :with => "pandaman@gmail.com"
		fill_in "user_password", :with => "112233"
		fill_in "user_password_confirmation", :with => "112233"
		click_button "Submit"

		expect(User.find_by(name: "Panda Man")).not_to be nil
	end

	scenario "password doesn't match" do
		visit signup_path

		fill_in "user_name", :with => "Giraff Guy"
		fill_in "user_email", :with => "giraffguy@gmail.com"
		fill_in "user_password", :with => "112233"
		fill_in "user_password_confirmation", :with => "111111"
		click_button "Submit"

		expect(User.find_by(name: "Giraff Guy")).to be nil
	end
end