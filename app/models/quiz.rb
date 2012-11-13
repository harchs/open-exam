class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description, :is_published

  has_many :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers
  after_initialize :init

  #validates :name, :presence => :true, :length => { :in => 4..40}, :uniqueness => :true
  #validates :description, :presence => true

  def init
    self.is_published ||= false
  end


  def next_question(question) 
    self.questions.length == question.position ? nil : self.questions.find_by_position(question.position + 1)
  end
end
