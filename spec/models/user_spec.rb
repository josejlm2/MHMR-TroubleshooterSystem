require 'rails_helper'

describe User do
	it "is a valid user" do
           user = User.new(email: 'name@test.com', password: 'password1', password_confirmation: 'password1', admin: true, manager: true)
	   expect(user).to be_valid
	end
end

