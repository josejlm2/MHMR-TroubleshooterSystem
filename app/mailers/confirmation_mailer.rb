class ConfirmationMailer < ActionMailer::Base
  default from: "mhmr.troubleshooter@gmail.com"

  def confirmation_email(ticket)
    @ticket = ticket
    @ticket_link = url_for :host => 'mhmr-troubleshootersystem.heroku.com', :controller => 'tickets', :action => 'show', :id => @ticket.id
    mail(to: @ticket.email, subject: 'Ticket Confirmation')
  end
end
