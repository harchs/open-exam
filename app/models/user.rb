class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :password, :password_confirmation, :role
  has_secure_password
  belongs_to :organization
  has_many :user_quizzes
  has_many :quizzes, :through => :user_quizzes
  has_many :answers

  validates :name, :presence => :true
  validates :email, :presence => :true

  def is_admin?
    self.role == "Admin" ? true : false 
  end  

  def has_taken?(quiz)
    self.answers.any?{ |answer| answer.quiz_id == quiz.id }
  end  


  def quizzes_to_add=(quiz_ids)
    quiz_ids.each do |quiz_id|
      self.user_quizzes.create(:quiz_id => quiz_id)
    end
  end

  def answers_for_quiz(quiz_id)
    self.answers.select {|answer| answer.quiz_id == quiz_id}
  end

  # tested answers_for_quiz in rails console and it works. 
end
