class QuizGrader
  def self.num_correct(answers, quiz)
    (answers.map(&:choice_id) & quiz.correct_choices.map(&:id)).count
  end
end