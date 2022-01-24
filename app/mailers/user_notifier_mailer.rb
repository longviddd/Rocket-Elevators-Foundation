class UserNotifierMailer < ApplicationMailer
    default :from => 'longatwork2000@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_lead_email(lead)
    @lead = lead
    mail( :to => @lead.email,
    :subject => 'Thank You For Contacting Us!')
  end
end
