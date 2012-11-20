class OpenExamMailer < ActionMailer::Base
  default from: "services@flatironschool.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered for Open Exam")
  end

end
