require 'rails_helper'

describe TicketsController do
   it "responds sucessfully with an Http 200 status code" do
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the tickets into @tickets" do
      ticket1, ticket2 = Ticket.create!, Ticket.create!
      get :index

      expect(assigns(:tickets)).to match_array([ticket1, ticket2])
    end
end