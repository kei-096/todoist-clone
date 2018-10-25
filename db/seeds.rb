# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

todo = {}

ActiveRecord::Base.transaction do
	50.times do
		todo['title'] = ["Shopping", "Code", "Study", "Work", "Travel", "Rest"].sample
		todo['due_date'] = Faker::Date.between(30.days.ago, 1.year.from_now)
		todo['priority'] = rand(1...5)
		todo['user_id'] = 1

		Todo.create(todo)
	end
end