# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category = Category.create(name: 'cars')
ticket = Ticket.create(requestor: 'John Doe', phone: '555-478-9332', ru: 2,email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: @location.id, ticket_category_id: @category.id)
email= Email.create(email_address: 'jack@yahoo.com')
