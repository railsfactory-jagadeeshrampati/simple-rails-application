class UserMailer < ActionMailer::Base
  default from: "jagadeesh@blog.com"
def welcome_email(user)
     @user = user
     @url = 'http://localhost:3000/users/sign_in'
     mail(to: @user.email, subject: 'welcome to my awesome site')

end

end
