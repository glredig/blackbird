# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event1 = Event.create!(summary: "Blackbird will be playing a private event", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: Time.now(), pay: 120000)
event2 = Event.create!(summary: "Blackbird will be playing downtown at the LadeeDa Festival", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 2.weeks.from_now, pay: 120000)
event3 = Event.create!(summary: "Blackbird will be playing at the Woopty Do Fair", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 2.months.from_now, pay: 120000)
event4 = Event.create!(summary: "Blackbird will be playing in the Phoenix Club on the river", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 6.months.from_now, pay: 120000)
event5 = Event.create!(summary: "This is a fifth test event, and this one happens to be longer than the others", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 8.months.from_now, pay: 120000)
event6 = Event.create!(summary: "This is a 6th test event, and this one happens to be longer than the others and takes place in the past", accessible: 0, location: "123 SW 18th Street, Awesome, CA", date: 8.months.ago, pay: 120000)

review1 = Review.create!(name: "John Doe", date: 2.years.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")
review2 = Review.create!(name: "Jane Doe", date: 1.year.ago, summary: "Blackbird was incredible! Because yea!", event: "Birthday")
review3 = Review.create!(name: "John Smith", date: 8.months.ago, summary: "Blackbird was incredible! Because yea!", event: "Festival")
review4 = Review.create!(name: "Ashley Johnston", date: 8.weeks.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")
review5 = Review.create!(name: "William Clay", date: 2.days.ago, summary: "Blackbird was incredible! Because yea!", event: "Wedding")

song1 = Song.create!(title: "Help!", artist: "The Beatles")
song2 = Song.create!(title: "Born to be Wild", artist: "Steppenwolf")
song3 = Song.create!(title: "Sunshine of Your Love", artist: "Cream")
song4 = Song.create!(title: "Eleanor Rigby", artist: "The Beatles")
song5 = Song.create!(title: "Yellow Submarine", artist: "The Beatles")
song6 = Song.create!(title: "Break on Through", artist: "The Doors")
song7 = Song.create!(title: "Please Please Me", artist: "The Beatles")
song8 = Song.create!(title: "Strawberry Fields Forever", artist: "The Beatles")

admin_user = User.create!(email: "admin@example.com", password: "password", admin: true)