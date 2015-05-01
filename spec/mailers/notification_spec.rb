require 'rails_helper'

describe NotificationMailer do
    describe 'instructions' do
        let(:ticket) { mock_model Ticket, requestor: 'Jane Doe', phone: '555-478-9332', ru: 2, email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, ticket_category_id: 1 }

        it 'sends the email' do
                 expect { NotificationMailer.notification_email(ticket)  }.to change { ActionMailer::Base.deliveries.count }.by( Email.count('id', :distinct => true))
        end

        it 'renders the sender email' do
		Email.find_each do |staff|
			expect { ActionMailer::Base.deliveries.find{ |mail| mail.to eq(staff.email_address)  } }.should_not be_nil
		end
        end
    end
end
