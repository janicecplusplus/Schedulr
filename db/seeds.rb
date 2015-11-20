# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! :username => 'nisarg', :email => 'nisarg@gmail.com', :id => 114, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'tanay', :email => 'tanay@gmail.com', :id => 111, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'janice', :email => 'janice@gmail.com', :id => 112, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'enyu', :email => 'enyu@gmail.com', :id => 113, :password => '12345678', :password_confirmation => '12345678'

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

Group.create({id: 36, title: "Group 1", description: "Group 1 Test"})
Group.create({id: 37, title: "Group 2", description: "Group 2 Test"})

GroupMembership.create(group_id: 36, member_id: 111, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 36, member_id: 112, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 36, member_id: 113, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 36, member_id: 114, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 37, member_id: 111, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 37, member_id: 112, member_type: "User", group_type: "Group")
