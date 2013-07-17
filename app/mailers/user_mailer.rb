class UserMailer < ActionMailer::Base
  default from: "jamesroypoulter@gmail.com"

  def registration_confirmation(user)
    mail(to: user.email, subject: 'Registered')
    @user = user
  end

end
