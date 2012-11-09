class Question < ActiveRecord::Base
  attr_accessible :name, :quiz_id, :choices_attributes, :choices

  belongs_to :quiz
  has_many :choices
  has_many :answers
  # This is because we want to eventually allow for checkbox answers
  accepts_nested_attributes_for :choices

  
  # def is_last_question?
    
  # end  
end
