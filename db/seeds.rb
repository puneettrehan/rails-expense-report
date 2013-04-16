# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "creating default user and admin"
User.create!(username: "user", password: "123123", password_confirmation: "123123")
User.create!(username: "admin", password: "123123", password_confirmation: "123123", role: USER_ROLES[0])

puts "creating expense types"
ExpenseType.create!(name: "Travel")
ExpenseType.create!(name: "Education")
ExpenseType.create!(name: "Health")