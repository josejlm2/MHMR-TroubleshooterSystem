require 'rails_helper'
Rspec.describe Category, :type => :model do
  context "with 2 or more comments" do
   it "order chronologically" do
	category1 = Category.create!(:name => "car")
	category2 = Category.create!(:name => "electricity")
	expect(category.reload
