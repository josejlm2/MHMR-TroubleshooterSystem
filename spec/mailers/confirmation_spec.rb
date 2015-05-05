require 'rails_helper'

describe ConfirmationMailer do
    describe 'instructions' do
        let(:ticket) { mock_model Ticket, requestor: 'Jane Doe', phone: '555-478-9332', ru: 2, email: 'john@doe.com', room: 652, subject: 'Please Help', description: 'I have a problem', location_id: 1, ticket_category_id: 1 }
        let(:mail) { ConfirmationMailer.confirmation_email(ticket) }

        it 'sends the email' do
		 expect { ConfirmationMailer.confirmation_email(ticket).deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
        end

	it 'renders the subject' do
		expect(mail.subject).to eql('Ticket Confirmation')
	end

	it 'renders the sender email' do
		expect(mail.to).to eql([ticket.email])
	end
    end
end
