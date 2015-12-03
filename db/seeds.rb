# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


=begin
User.create! :username => 'nisarg', :email => 'nisarg@gmail.com', :id => 1114, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'tanay', :email => 'tanay@gmail.com', :id => 1111, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'janice', :email => 'janice@gmail.com', :id => 1112, :password => '12345678', :password_confirmation => '12345678'
User.create! :username => 'enyu', :email => 'enyu@gmail.com', :id => 1113, :password => '12345678', :password_confirmation => '12345678'


Event.create([
  { title: "Enyu's Event", start_time: "2015-11-12 18:00:00", end_time: "2015-11-12 19:00:00", user_id: 1},
  { title: "Janice's Event", start_time: "2015-11-12 18:30:00", end_time: "2015-11-12 19:30:00", user_id: 2},
  { title: "Tanay's Event", start_time: "2015-11-12 19:00:00", end_time: "2015-11-12 20:00:00", user_id: 3},
  { title: "Nisarg's Event", start_time: "2015-11-12 19:30:00", end_time: "2015-11-12 20:30:00", user_id: 4}
])

Group.create({id: 36, title: "Group 1", description: "Group 1 Test"})
Group.create({id: 37, title: "Group 2", description: "Group 2 Test"})

GroupMembership.create(group_id: 1036, member_id: 111, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 1036, member_id: 112, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 1036, member_id: 113, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 1036, member_id: 114, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 1037, member_id: 111, member_type: "User", group_type: "Group")
GroupMembership.create(group_id: 1037, member_id: 112, member_type: "User", group_type: "Group")
=end


num_total_users = 500
confirmed_friendships_per_user = 5         #multiply this by 2 for total friendships
unconfirmed_friendships_per_user = 5
events_per_user = 5
users_per_group = 3 #MUST be less than confirmed friendships. Add 1 to this for group creator
#user creation
for user_num in 1..num_total_users do
	username = 'user_'+user_num.to_s
	email = username+'@J10.com'
	User.create(
		username: username,
		email: email,
		password: '12345678',
		password_confirmation: '12345678',
		id: user_num
		)
end

#friendship and group creation
for user_num in 1..(num_total_users - confirmed_friendships_per_user -unconfirmed_friendships_per_user) do
	current_user = 'user_' + user_num.to_s

	#confirmed friendships
	for confirmed_num in 1..confirmed_friendships_per_user do
		Friendship.create(user_id: user_num, friend_id: (user_num + confirmed_num), confirmed: 1)
	end

	#group creation
	Group.create(id: user_num, title: Faker::Company.name, description: Faker::Lorem.sentence)
	 #starts from 0 to include current user in group
	for group_friend_num in 0..users_per_group do
		GroupMembership.create(
			group_id: user_num,
			member_id: user_num + group_friend_num,
			member_type: "User",
			group_type: "Group")
	end

	#unconfirmed friendships
	for unconfirmed_num in 1..unconfirmed_friendships_per_user do
		num = (user_num + confirmed_friendships_per_user + unconfirmed_num)
		Friendship.create(user_id: user_num, friend_id: num, confirmed:0)
	end
end

#events creation
num_total_users.times do |user_num|
	events_per_user.times do |event_num|
		title = Faker::Lorem.word
		description = Faker::Lorem.sentence
		start_time = Faker::Time.between(5.days.ago, Time.now)
		end_time = start_time + (60 * 30) #30 minute events
		Event.create(title: title, description: description, user_id: user_num, start_time: start_time, end_time: end_time)
	end
end







