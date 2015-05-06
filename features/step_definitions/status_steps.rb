Given(/^I have a status name (.+)$/) do |names|
  names.split(',').each do |name|
    Status.create!(:name => name) 
  end
end

Then(/^I should have (\d+) status$/) do |count|
  Status.count.should == count.to_i 
end
