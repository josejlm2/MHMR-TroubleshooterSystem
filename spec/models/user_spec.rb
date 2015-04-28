require 'rails_helper'
RSpec.describe "loging in", :type => :feature do
  it "allows an existing user to sign in" do
    user = User.create!(email: "name@name.com", password: "password1")
    visit "/users/sign_in"
    fill_in "Email", :with => "name@name.com"
    fill_in "Password", :with => "password1"

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  it "rejects a non existing user from signing in" do
    visit "/users/sign_in"
    fill_in "Email", :with =>"name@test.com"
    fill_in "Password", :with => "password1"

    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end
end