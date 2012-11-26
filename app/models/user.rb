class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :password, :password_confirmation, :role
  has_secure_password
  belongs_to :organization
  has_many :user_quizzes
  has_many :quizzes, :through => :user_quizzes
  has_many :answers
  has_many :questions

  validates :name, :presence => :true
  validates :email, :presence => :true

  def is_admin?
    self.role.downcase == "admin" ? true : false 
  end  

  # def has_taken?(quiz)
  #   self.answers.any?{ |answer| answer.quiz_id == quiz.id }
  # end  
 
  def has_taken?(quiz)
    self.answers_for_quiz(quiz.id).count == quiz.approved_questions.count 
  end  

  def has_started?(quiz)
    self.answers_for_quiz(quiz.id).count > 0
  end

  def answers_for_quiz(quiz_id)
    self.answers.select {|answer| answer.quiz_id == quiz_id}
  end
end
