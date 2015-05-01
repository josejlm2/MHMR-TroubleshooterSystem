# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
status_list = [
	"In Progress",
	"Completed",
	"Not Started"
]
category_list = [
	"Car",
	"Building",
	"Other"
]
location_list = [
	"Bryan",
	"Webb",
	"Laredo"
]
@status = []
@category = []
@location = []
status_list.each do |name|
    @status.push( Status.create(name: name))
end

category_list.each do |name|
    @category.push(Category.create(name: name))
end

location_list.each do |name|
    @location.push(Location.create(name: name))
end
(0..5).each do 
  ticket = Ticket.create(requestor: 'John Doe', phone: '555-478-9332', ru: 2, email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', status_id: @status[rand(3)].id, location_id: @location[rand(3)].id, category_id: @category[rand(3)].id)
end
email= Email.create(email_address: 'jack@yahoo.com')

user = User.create(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
user = User.create(email: 'name@admin.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: false)
user = User.create(email: 'name@normal.com', password: 'password1', password_confirmation: 'password1', admin: false, manager: false)
user = User.create(email: 'name@manager.com', password: 'password1', password_confirmation: 'password1', admin: false, manager: true)
