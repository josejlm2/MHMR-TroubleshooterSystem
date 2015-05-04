require 'rails_helper'

describe TicketsController do
   it "responds sucessfully with an Http 200 status code" do
	user = double('user')
	allow(request.env['warden']).to receive(:authenticate!) {user}
	allow(controller).to receive(:current_user) {user}
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the tickets into @tickets" do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      ticket1, ticket2 = Ticket.create!, Ticket.create!
      get :index

      expect(assigns(:tickets)).to match_array([ticket1, ticket2])
    end
end
