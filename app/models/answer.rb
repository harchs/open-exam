# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  user_id     :integer
#  quiz_id     :integer
#  question_id :integer
#  choice_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :name, :question_id, :quiz_id, :user_id

  belongs_to :user
  belongs_to :quiz
  belongs_to :question
  belongs_to :choice

  validates :choice_id, :presence => true
  validates :question_id, :presence => true
  validates :quiz_id, :presence => true
  validates :user_id, :presence => true

  validates_uniqueness_of :question_id, :scope => [:user_id, :quiz_id]
end
