class Question < ActiveRecord::Base
  attr_accessible :name, :quiz_id, :choices_attributes, :choices, :position, :selected

  belongs_to :quiz
  has_many :choices
  has_many :answers

  acts_as_list :scope => :quiz

  # This is because we want to eventually allow for checkbox answers
  accepts_nested_attributes_for :choices

  after_initialize :init

  def init
    self.selected ||= false
  end

  
  def is_last_question?
    self.quiz.questions.count == self.sort_order
  end  
end
