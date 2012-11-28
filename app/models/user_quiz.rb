# == Schema Information
#
# Table name: user_quizzes
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  quiz_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  num_correct     :integer
#  total_questions :integer
#  status          :text
#

class UserQuiz < ActiveRecord::Base
  attr_accessible :quiz_id, :user_id, :num_correct, :total_questions, :status

  belongs_to :user
  belongs_to :quiz
end
