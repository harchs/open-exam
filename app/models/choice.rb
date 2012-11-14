class Choice < ActiveRecord::Base
  attr_accessible :is_correct, :name, :question_id

  belongs_to :question
  has_many :answers

  validates :name, :presence => true
  #validates :is_correct, :inclusion => {:in => [true, false]}

end
