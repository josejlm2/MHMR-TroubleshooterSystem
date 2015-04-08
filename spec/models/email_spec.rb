require 'rails_helper'


describe Email do
	it "is a valid email" do
           email = Email.new( email_address: "jack@yahoo.com")
	   expect(email).to be_valid
	end
end
