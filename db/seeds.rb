# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event1 = Event.create!(summary: "This is a test event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: Time.now(), pay: 120000)
event2 = Event.create!(summary: "This is a second test event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 2.weeks.from_now, pay: 120000)
event3 = Event.create!(summary: "This is a third test event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 2.months.from_now, pay: 120000)
event4 = Event.create!(summary: "This is a fourth test event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 6.months.from_now, pay: 120000)
event5 = Event.create!(summary: "This is a fifth test event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 8.months.from_now, pay: 120000)

review1 = Review.create!(name: "John Doe", date: 2.years.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")
review2 = Review.create!(name: "Jane Doe", date: 1.year.ago, summary: "Blackbird was incredible! Because yea!", event: "Birthday")
review3 = Review.create!(name: "John Smith", date: 8.months.ago, summary: "Blackbird was incredible! Because yea!", event: "Festival")
review4 = Review.create!(name: "Ashley Johnston", date: 8.weeks.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")
review5 = Review.create!(name: "William Clay", date: 2.days.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")

admin_user = User.create!(email: "admin@example.com", password: "password", admin: true)