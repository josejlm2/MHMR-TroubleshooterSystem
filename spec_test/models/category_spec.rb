require 'rails_helper'

describe Category do
	it "is a valid category" do
           category = Category.new( name: "Car")
	   expect(category).to be_valid
	end
end
