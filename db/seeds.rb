# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.random = nil
Faker::Config.random.seed

Expense.destroy_all
Budget.destroy_all


budget_names = ['Housing','Utilities','Food','Transportation','Subscriptions']


budget_names.each do |name| 
  budget = Budget.create(name: name, budget_max: Faker::Number.number(digits:rand(1..4)))
  rand(1..5).times do
    expense = Expense.create(name: Faker::Ancient.titan, amount: Faker::Number.decimal(l_digits:rand(1..3),r_digits:2))
    budget.expenses << expense
    budget.save
  end
end
