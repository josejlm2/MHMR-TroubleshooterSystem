Then(/^I should have a notification email sent for each facility manager$/) do
    ActionMailer::Base.deliveries.count.should == Email.count('id', :distinct => true) + 1
end
Then(/^the notification emails should be sent to each facility manager$/) do
    Email.find_each do |staff|
	ActionMailer::Base.deliveries.find{ |mail| mail.to eq(staff.email_address)  }.should_not be_nil
    end
end
Then(/^the notification emails should have a subject of "(.+)"$/) do |subject|
    ActionMailer::Base.deliveries do |mail|
       mail.subject.should eq(subject) 
    end
end
