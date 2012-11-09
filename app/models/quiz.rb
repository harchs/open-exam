class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description , :questions_attributes, :is_published

  has_many :questions
  accepts_nested_attributes_for :questions 
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers

  validates :name, :presence => :true, :length => { :in => 4..40}, :uniqueness => :true
  validates :description, :presence => true
end
