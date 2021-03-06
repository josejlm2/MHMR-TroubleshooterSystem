require 'rails_helper'

describe CategoriesController do
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

    it "loads all of the categories into @categories" do
      user = User.create!(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
      allow(request.env['warden']).to receive(:authenticate!) {user}
      allow(controller).to receive(:current_user) {user}
      category1, category2 = Category.create!, Category.create!
      get :index

      expect(assigns(:categories)).to match_array([category1, category2])
    end
end
