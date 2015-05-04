Given /^I have no emails$/ do
   Email.delete_all
end
Given /^I have emails name (.+)$/ do |names|
	names.split(',').each do |name|
		Email.create!(:email_address => name)
	end
end
Given /^I have a email name (.+)$/ do |name|
     @email= Email.create!(:email_address => name)
end
Then /^I should have ([0-9]+) emails$/ do |count|
    Email.count.should == count.to_i
end
Then /^I should have ([0-9]+) email$/ do |count|
    Email.count.should == count.to_i
end

Given /^I click on create email$/ do 
	click_on('Add Button')
end
Given /^I click on delete email$/ do 
	click_on('Delete Button')
end
