require 'rails_helper'

describe CategoriesController do
   it "responds sucessfully with an Http 200 status code" do
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the categories into @categories" do
      category1, category2 = Category.create!, Category.create!
      get :index

      expect(assigns(:categories)).to match_array([category1, category2])
    end
end
