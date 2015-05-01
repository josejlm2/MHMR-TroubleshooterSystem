Given /^(?:a clear email queue|no emails have been sent)$/ do
    ActionMailer::Base.deliveries.clear
end
Then(/^I should have (\d+) confirmation e\-mails sent$/) do |count|
    ActionMailer::Base.deliveries.count.should == count.to_i
end
Then(/^the confirmation e\-mails should be sent to "(.+)"$/) do |address|
    ActionMailer::Base.deliveries.last.to.should eq([address])
end
Then(/^the confirmation e\-mails should have a subject of "(.+)"$/) do |subject|
    ActionMailer::Base.deliveries.last.subject.should eq(subject)
end
