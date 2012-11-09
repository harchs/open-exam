class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :is_published

  has_many :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers
end
