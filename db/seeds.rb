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

Friendship.create({ user_id: 1, friend_id: 2, confirmed: 0})
Friendship.create({ user_id: 1, friend_id: 3, confirmed: 1})
