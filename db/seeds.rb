# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Account.create([
    {first_name: "Sarah", last_name: "Smith", username: "sarahj", email: "sarah@example.com", password: "password1"},
    {first_name: "John", last_name: "Smith", username: "johns", email: "john@example.com", password: "password2"},
    {first_name: "Davis", last_name: "Andrews", username: "davisa", email: "davis@example.com", password: "password3"},
    {first_name: "Nancy", last_name: "Lee", username: "nancyl", email: "nancy@example.com", password: "password4"},
    {first_name: "Tina", last_name: "Tran", username: "tinat", email: "tina@example.com", password: "password5"},
])