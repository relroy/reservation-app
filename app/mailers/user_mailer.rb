class UserMailer < ApplicationMailer
  default from: "relroy5499@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(admin, first_name, last_name, email, phone, id)
    @admin = 'relroy5499@gmail.com'
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @id = id
   

    mail to: 'relroy5499@gmail.com', subject: "New Sign Up!"
  end

  def date_reserved(reservation)
    @reservation = reservation

    mail to: @reservation.user.email, subject: "Olson's Date Reserved"

    
  end
end
