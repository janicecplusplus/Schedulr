# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([
  { email: "enyu@gmail.com", username: "enyu", password: "corncorn" },
  { email: "janice@gmail.com", username: "janice", password: "blahblah" },
  { email: "tanay@gmail.com", username: "tanay", password: "hahahaha" },
  { email: "nisarg@gmail.com", username: "nisarg", password: "lolololol" }
])

Friendship.create([
  { user_id: 1, friend_id: 2, confirmed: 0},
  { user_id: 1, friend_id: 3, confirmed: 1}
])

Event.create([
  { title: "Enyu's Event", start_time: "2015-11-12 18:00:00", end_time: "2015-11-12 19:00:00", user_id: 1},
  { title: "Janice's Event", start_time: "2015-11-12 18:30:00", end_time: "2015-11-12 19:30:00", user_id: 2},
  { title: "Tanay's Event", start_time: "2015-11-12 19:00:00", end_time: "2015-11-12 20:00:00", user_id: 3},
  { title: "Nisarg's Event", start_time: "2015-11-12 19:30:00", end_time: "2015-11-12 20:30:00", user_id: 4}
])