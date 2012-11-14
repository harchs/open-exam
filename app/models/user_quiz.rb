class UserQuiz < ActiveRecord::Base
  attr_accessible :quiz_id, :user_id

  belongs_to :user
  belongs_to :quiz
end
