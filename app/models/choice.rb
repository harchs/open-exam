# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  is_correct  :boolean          default(FALSE)
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Choice < ActiveRecord::Base
  attr_accessible :is_correct, :name, :question_id

  belongs_to :question
  has_many :answers

  after_initialize :set_default_value

  validates :name, :presence => true

  def set_default_value
    self.is_correct ||= false
  end
end
