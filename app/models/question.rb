# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  name       :text
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#  selected   :boolean          default(FALSE)
#  user_id    :integer
#

class Question < ActiveRecord::Base
  attr_accessible :name, :quiz_id, :choices_attributes, :choices, :position, :selected, :user_id

  belongs_to :quiz
  belongs_to :user
  has_many :choices
  has_many :answers

  acts_as_list :scope => :quiz
  # This is because we want to eventually allow for checkbox answers
  accepts_nested_attributes_for :choices
  after_initialize :set_default_values

  alias :author :user
  validates :name, :presence => true, :length => {:maximum => 500}
  validates :choices, :length => { :minimum => 2, :message => " must have at least two options"}
  validate :validate_unique_choices
  
  def set_default_values
    self.selected ||= false
  end
  
  # def is_last_question?   
  #   self.quiz.approved_questions.count == self.sort_order
  # end  

  def is_selected?
    self.selected 
  end  

  def validate_unique_choices
    validate_uniqueness_of_in_memory(choices, [:name, :question_id], 'Duplicate Choice.')
  end
 
  def absolute_position
    self.quiz.approved_questions.index(self) + 1
  end
end
