class Choice < ActiveRecord::Base
  attr_accessible :is_correct, :name, :question_id

  belongs_to :question
  has_many :answers

  after_initialize :set_default_value

  validates :name, :presence => true
  #validates :is_correct, :inclusion => {:in => [true, false]}

  def set_default_value
    self.is_correct ||= false
  end
end
