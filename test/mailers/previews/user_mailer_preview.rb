# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.find_by_email("georginaxpuig@gmail.com")
    UserMailer.welcome(user)
  end

  # def booking_confirmation
  #   booking = # complete this after booking feature is done
  #   UserMailer.booking_confirmation(booking)
  # end

end
