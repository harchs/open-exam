class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description, :is_published, :passing_grade

  has_many :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers
  after_initialize :set_default_value

  #validates :name, :presence => :true, :length => { :in => 4..40}, :uniqueness => :true
  #validates :description, :presence => true
  validates :name, :presence => :true
  validates :description, :presence => true
  validates :passing_grade, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}

  def set_default_value
    self.is_published ||= false
  end


  def next_question(question)
    question_set = self.approved_questions
    current_index = question_set.index(question)

    question_set[current_index + 1]
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



end
