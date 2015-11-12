# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({ email: "enyu@gmail.com", password: "corncorn" })
User.create({ email: "janice@gmail.com", password: "corncorn" })
User.create({ email: "tanay@gmail.com", password: "corncorn" })
User.create({ email: "nisarg@gmail.com", password: "corncorn" })

Friendship.create({ user_id: 1, friend_id: 2, confirmed: 0})
Friendship.create({ user_id: 1, friend_id: 3, confirmed: 1})
