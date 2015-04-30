require 'rails_helper'

RSpec.describe UsersController do
   it "responds sucessfully with an Http 200 status code" do
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the users into @users" do
      user1 = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true), 
      user2 = User.create!(email: 'name@test2.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
end
