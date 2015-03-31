Given /^I have no categories$/ do
   Category.delete_all
end
Given /^I have categories name (.+)$/ do |names|
	names.split(',').each do |name|
		Category.create!(:name => name)
	end
end
Given /^I have a category name (.+)$/ do |name|
     @category= Category.create!(:name => name)
end
Then /^I should have ([0-9]+) category$/ do |count|
    Category.count.should == count.to_i
end



