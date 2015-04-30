require 'rails_helper'

RSpec.describe UsersController do
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

    it "loads all of the users into @users" do
      user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      user1, user2 = User.create!(email: 'name@test1.com', password: 'password1'), User.create!(email: 'name@test2.com', password: 'password1')
      get :index

      expect(assigns(:users)).to match_array([user, user1, user2])
    end
end
