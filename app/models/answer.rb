class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :name, :question_id, :quiz_id, :user_id

  belongs_to :user
  belongs_to :quiz
  belongs_to :question
  belongs_to :choice

  validates_uniqueness_of :question_id, :scope => [:user_id, :quiz_id]
end
