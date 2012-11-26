class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description, :is_published, :passing_grade

  has_many :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers

  validates :name, :presence => :true
  validates :description, :presence => true
  validates :passing_grade, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}

  after_initialize :set_default_value
  # before_update :has_questions?

  def set_default_value
    self.is_published ||= false
  end

  def is_ready_to_take?
    self.approved_questions.length > 0 && self.is_published
  end

  def next_question(question)
    current_index = approved_questions.index(question)

    approved_questions[current_index + 1]
  end

  def taken_by?(user)
    self.answers.any?{ |answer| answer.user_id == user.id }
  end  

  def correct_choices
    self.approved_questions.map(&:choices).flatten!.select(&:is_correct)
  end

  def approved_questions
    self.questions.order(:position).select{|question| question.selected}
  end

  def user_quiz_for(user)
    self.user_quizzes.find_by_user_id(user.id)
  end

  def has_questions?
    self.questions.find_all_by_selected(true).count > 0
  end

end
