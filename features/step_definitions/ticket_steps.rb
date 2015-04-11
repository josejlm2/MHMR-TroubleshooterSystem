
Given /^I have no tickets$/ do
   Ticket.delete_all
end
Given /^I have tickets requestor (.+)$/ do |requestors|
	requestors.split(',').each do |requestor|
		Ticket.create!(:requestor => requestor, :room => 214)
	end
end
Given /^I have a ticket requestor (.+)$/ do |requestor|
     @ticket= Ticket.create!(:requestor => requestor, :room => 214)
end
Then /^I should have ([0-9]+) ticket$/ do |count|
    Ticket.count.should == count.to_i
end
