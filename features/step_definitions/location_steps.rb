Given(/^I have a location name (.+)$/) do |names|
  names.split(',').each do |name|
    Location.create!(:name => name) 
  end
end

Then(/^I should have (\d+) location$/) do |count|
  Location.count.should == count.to_i 
end

Given /^I have no locations$/ do
   Location.delete_all
end
