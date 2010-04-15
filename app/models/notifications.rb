class Notifications < ActionMailer::Base
  def set_up_email
    sent_on Time.now
    from "McGreasy@greasythug.net"
  end

  def signup(user)
    set_up_email
    subject 'Notifications#signup'
    recipients user.email

    body :greeting => 'Hi,'
  end

  def reset_password(user)
    set_up_email
    subject "Reset Password Request"
    recipients user.email

    body :reset_url => edit_password_reset_url(user.perishable_token)
  end
end
