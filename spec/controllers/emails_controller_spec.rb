require 'rails_helper'

describe EmailsController do
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

    it "loads all of the emails into @emails" do
      user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      email1, email2 = Email.create!, Email.create!
      get :index

      expect(assigns(:emails)).to match_array([email1, email2])
    end
end
