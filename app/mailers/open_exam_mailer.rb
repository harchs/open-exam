class OpenExamMailer < ActionMailer::Base
  default from: "services@flatironschool.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered for Open Exam")
  end

  def collaboration_invite(users, quiz)
    @quiz = quiz
    @url = quiz_path(quiz)
    mail(:to => users, :subject => "You've been invited to collaborate on a quiz!")
  end
end
