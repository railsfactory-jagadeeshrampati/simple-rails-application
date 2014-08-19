class UserMailer < ActionMailer::Base
  default from: "jagadeesh@blog.com"
def welcome_email(user)
     @user = user
     @url = "http://shrouded-journey-6603.herokuapp.com/posts"
     mail(to: @user.email, subject: 'welcome to my awesome site')

end

end
