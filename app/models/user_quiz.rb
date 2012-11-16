class UserQuiz < ActiveRecord::Base
  attr_accessible :quiz_id, :user_id, :num_correct, :total_questions

  belongs_to :user
  belongs_to :quiz
end
