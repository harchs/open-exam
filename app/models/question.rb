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
  validates :choices, :length => { :minimum => 2, :message => "You must add at least 2 choices."}

  def set_default_values
    self.selected ||= false
  end
  
  def is_last_question?
    self.quiz.questions.count == self.sort_order
<<<<<<< HEAD
  end  

=======
  end 

  validate :validate_unique_choices

  def validate_unique_choices
    validate_uniqueness_of_in_memory(choices, [:name, :question_id], 'Duplicate Choice.')
  end
 
>>>>>>> validates uniqueness of WITH nested attributesgit add .
end
