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


Event.create({id: 111, user_id: 111, title: "111_1"})
Event.create({id: 112, user_id: 111, title: "111_2"})
Event.create({id: 113, user_id: 112, title: "112_1"})
Event.create({id: 114, user_id: 113, title: "113_1"})
Event.create({id: 115, user_id: 113, title: "113_2"})


Group.create({id: 36, title: "Group 1"})
Group.create({id: 37, title: "Group 2"})

GroupMembership.create(group_id: 36, member_id: 111)
GroupMembership.create(group_id: 36, member_id: 112)
GroupMembership.create(group_id: 36, member_id: 113)
GroupMembership.create(group_id: 36, member_id: 114)
GroupMembership.create(group_id: 37, member_id: 111)
GroupMembership.create(group_id: 37, member_id: 112)