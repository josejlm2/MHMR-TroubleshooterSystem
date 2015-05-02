require 'rails_helper'


describe Ticket do
	it "is a valid ticket" do
           ticket = Ticket.new(requestor: 'John Doe', phone: '555-478-9332', ru: 2,email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, category_id: 1, status_id: 1)
	   expect(ticket).to be_valid
	end
end
