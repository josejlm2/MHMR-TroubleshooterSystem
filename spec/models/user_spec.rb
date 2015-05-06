require 'rails_helper'

describe User do
	it "is a valid user" do
           user = User.new(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
	   expect(user).to be_valid
	end
   it "Allows a user to sign in with a correct password" do
        user1 = User.create(email: 'name@test1.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
        visit "/mhmr/users/sign_in"
        fill_in "Email", :with => "name@test1.com"
        fill_in "Password", :with => "password1"

	click_button "Log in"
        expect(page).to have_content("Log In")
   end
   it "rejects a user signing in with an incorrect password" do
        user = User.create(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
        visit "/mhmr/users/sign_in"
        fill_in "Email", :with => "name@test.com"
        fill_in "Password", :with => "password"

	click_button "Log in"
        expect(page).to have_content("Log In")
   end
end

