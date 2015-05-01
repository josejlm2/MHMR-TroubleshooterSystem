class NotificationMailer < ActionMailer::Base
  default from: "mhmr.troubleshooter@gmail.com"

  def notification_email(ticket)
    @ticket = ticket
    @ticket_link = url_for :controller => 'tickets', :action => 'show', :id => @ticket.id
    Email.find_each do |staff|
      mail(to: staff.email_address, from: 'mhmr.troubleshooter@gmail.com', subject: 'Ticket Notification').deliver
    end
  end
end
