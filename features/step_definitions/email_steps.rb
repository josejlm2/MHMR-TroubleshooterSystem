Given /^I have no emails$/ do
   Email.delete_all
end
Given /^I have emails name (.+)$/ do |names|
	names.split(',').each do |name|
		Email.create!(:name => name)
	end
end
Given /^I have a email name (.+)$/ do |name|
     @email= Email.create!(:name => name)
end
Then /^I should have ([0-9]+) emails$/ do |count|
    Email.count.should == count.to_i
end



