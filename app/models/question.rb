class Question < ActiveRecord::Base
  attr_accessible :name, :quiz_id, :choices_attributes, :choices, :position, :selected

  belongs_to :quiz
  has_many :choices
  has_many :answers

  acts_as_list :scope => :quiz
  # This is because we want to eventually allow for checkbox answers
  accepts_nested_attributes_for :choices
  after_initialize :set_default_values

  validates :name, :presence => true
  validate :validate_question_has_choices

  def set_default_values
    self.selected ||= false
  end

  
  def is_last_question?
    self.quiz.questions.count == self.sort_order
  end  

  def validate_question_has_choices
    unless choices && choices.count >= 2
      self.errors[:base] << "You must add at least 2 choices."
    end
  end
end
