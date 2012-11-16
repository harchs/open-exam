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
  validates :choices, :length => { :minimum => 2, :message => " must have at least two options"}

  def set_default_values
    self.selected ||= false
  end
  
  def is_last_question?
    self.quiz.approved_questions.count == self.sort_order
  end  

  def is_selected?
    self.selected 
  end  

  validate :validate_unique_choices

  def validate_unique_choices
    validate_uniqueness_of_in_memory(choices, [:name, :question_id], 'Duplicate Choice.')
  end
 
  def absolute_position
    self.quiz.approved_questions.index(self) + 1
  end
end
