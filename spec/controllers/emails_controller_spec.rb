require 'rails_helper'

describe EmailsController do
   it "responds sucessfully with an Http 200 status code" do
	get :index
	expect(response).to be_success
   end
   it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the emails into @emails" do
      email1, email2 = Email.create!, Email.create!
      get :index

      expect(assigns(:emails)).to match_array([email1, email2])
    end
end
