Given /^I have no categories$/ do
   Category.delete_all
end
Then /^I should have ([0-9]+) category$/ do |count|
    Category.count.should == count.to_i
end

