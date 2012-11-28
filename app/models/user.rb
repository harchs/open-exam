 # == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  role            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :password, :password_confirmation, :role, :organization
  has_secure_password
  belongs_to :organization
  has_many :user_quizzes
  has_many :quizzes, :through => :user_quizzes
  has_many :answers
  has_many :questions

  validates :name, :presence => :true
  validates :email, :presence => :true
  validates_associated :organization

  after_initialize :set_defaults

  def set_defaults
    self.role ||= "student"
  end

  def is_admin?
    self.role.downcase == "admin" ? true : false 
  end  

  def is_superuser?
    self.role.downcase == "superuser" ? true : false
  end  

  # def has_taken?(quiz)
  #   self.answers.any?{ |answer| answer.quiz_id == quiz.id }
  # end  
 
  def has_taken?(quiz)
    self.answers_for_quiz(quiz.id).count == quiz.approved_questions.count 
  end  

  def has_started?(quiz)
    self.answers_for_quiz(quiz.id).count > 0 && !has_taken?(quiz)
  end

  def answers_for_quiz(quiz_id)
    self.answers.select {|answer| answer.quiz_id == quiz_id}
  end
end
