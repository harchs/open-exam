class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :password, :password_confirmation, :role
  has_secure_password
  belongs_to :organization
  has_many :quizzes
  has_many :answers

  validates :name, :presence => :true
  validates :email, :presence => :true

  def is_admin?
    self.role == "Admin" ? true : false 
  end  

  def has_taken?(quiz)
    self.answers.any?{ |answer| answer.quiz_id == quiz.id }
  end  

end
