# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
status_list = [
	"Not Started",
	"In Progress",
	"Closed"
]
category_list = [
	"Car",
	"AC",
	"Other",
        "Building",
        "Electrical",
        "Plumbing"
]
location_list = [
	"Norwood – HCS Hearne",
        "Bluebonnet – HCS Brenham",
        "Butler, Brenham",
        "Caldwell",
        "Centerville",
        "LCC/BC",
        "Family Tree",
        "Hearne",
        "Kerr St – HCS Brenham",
        "Madisonville",
        "Marylake – A",
        "Marylake – C",
        "Maywood – HCS Bryan",
        "Navasota",
        "804"
]
@created_dates_list =[
	"2015-05-01 17:59:12",
	"2015-04-05 17:59:12",
        "2015-03-06 17:59:12",
	"2015-02-14 17:59:12",
	"2015-02-08 17:59:12",
        "2015-01-01 17:59:12"
]
@updated_dates_list =[
	"2015-06-01 17:59:12",
	"2015-05-05 17:59:12",
        "2015-04-06 17:59:12",
	"2015-03-14 17:59:12",
	"2015-03-08 17:59:12",
        "2015-02-01 17:59:12"
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
# created_at: "2015-05-01 17:59:12", updated_at: "2015-05-01 17:59:12"
(0..5).each do |i| 
  ticket = Ticket.create(requestor: 'John Doe', phone: '555-478-9332', ru: 2, email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', status_id: @status[rand(3)].id, location_id: @location[rand(3)].id, category_id: @category[rand(3)].id, created_at: @created_dates_list[i], updated_at: @updated_dates_list[i])
end
email= Email.create(email_address: 'jack@yahoo.com')

user = User.create(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
user = User.create(email: 'name@admin.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: false)
user = User.create(email: 'name@normal.com', password: 'password1', password_confirmation: 'password1', admin: false, manager: false)
user = User.create(email: 'name@manager.com', password: 'password1', password_confirmation: 'password1', admin: false, manager: true)
