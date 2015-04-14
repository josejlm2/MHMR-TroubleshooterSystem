# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category = Category.create(name: 'cars')
<<<<<<< HEAD
ticket = Ticket.create(requestor: 'John Doe', phone: '555-478-9332', ru: 2,email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, ticket_category_id: 1)
=======
email= Email.create(email_address: 'jack@yahoo.com')
>>>>>>> 5998aa1634d7665e756c360e8644482005e4b2ef
