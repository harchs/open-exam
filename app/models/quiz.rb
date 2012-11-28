# == Schema Information
#
# Table name: quizzes
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  creator_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  description     :text
#  is_published    :boolean          default(FALSE)
#  passing_grade   :integer
#  organization_id :integer
#

class Quiz < ActiveRecord::Base
  attr_accessible :creator_id, :name, :description, :is_published, :passing_grade, :organization_id

  has_many :questions
  has_many :user_quizzes
  has_many :users, :through => :user_quizzes
  has_many :answers
  belongs_to :organization

  validates :name, :presence => :true, :length => {:maximum => 100}
  validates :description, :presence => true, :length => {:maximum => 500}
  validates :organization_id, :presence => true
  validates :passing_grade, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}

  after_initialize :set_default_value

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

  # def taken_by?(user)
  #   self.answers.any?{ |answer| answer.user_id == user.id }
  # end  

  def taken_by?(user)
    true if user.has_taken?(self)
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

  def question_to_resume(user)
    self.approved_questions.detect{|question| !user.answers.collect(&:question_id).include?(question.id) }
  end

  def publish(status)
    case status
    when "true", true
      publish!
    when "false", false
      unpublish!
    end
  end

  def in_progress
    self.user_quizzes.select {|user_quiz| user_quiz.status == "In Progress"}
  end  

  def completed
    self.user_quizzes.select {|user_quiz| user_quiz.status == "Completed"}
  end 

  def not_taken
    yetto = self.user_quizzes.select {|user_quiz| user_quiz.status == "Completed" || "In Progress"}
    #yetto_ids = yetto.map { |x| x.user_id}
    #yetto_users = yetto_ids.map { |x| User.find(x)}   
    
    #User.find_by_organization_id(@current_org.id).all - yetto_users

  end  

  private 

    def unpublish!
      self.update_attributes(:is_published => false)
    end

    def publish!
      self.update_attributes(:is_published => true) if is_publishable?
    end

    def is_publishable?
      has_selected_questions?
    end

    def has_selected_questions?
      self.approved_questions.count > 0
    end


end
