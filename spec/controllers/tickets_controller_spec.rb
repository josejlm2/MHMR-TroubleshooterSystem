require 'rails_helper'

describe TicketsController do
   it "responds sucessfully with an Http 200 status code" do
	user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
		allow(request.env['warden']).to receive(:authenticate!) {user}
		allow(controller).to receive(:current_user) {user}
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the tickets into @tickets" do
      user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      ticket1, ticket2 = Ticket.create!(requestor: 'John Doe', phone: '555-478-9332', ru: 2,email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, category_id: 1, status_id: 1), Ticket.create!(requestor: 'John Doe', phone: '555-478-9332', ru: 2,email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, category_id: 1, status_id: 1)
      get :index

      expect(assigns(:tickets)).to match_array([ticket1, ticket2])
    end
end
