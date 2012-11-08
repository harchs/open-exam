class Question < ActiveRecord::Base
  attr_accessible :name, :quiz_id

  belongs_to :quiz
  has_many :choices
  has_many :answers
end
