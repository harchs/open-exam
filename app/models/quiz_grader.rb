class QuizGrader
  def self.num_correct(answers, quiz)
    (answers.map(&:choice_id) & quiz.correct_choices.map(&:id)).count
  end

  def self.average_quiz_score(quiz)
    scores = quiz.user_quizzes.collect{|user_quiz| user_quiz.num_correct}
    if (quiz.user_quizzes.count > 0)
      scores.sum / quiz.user_quizzes.count
    else
      0
    end
  end  

  def self.percent_correct(quiz)
    raw_score = average_quiz_score(quiz).to_f
    if (quiz.user_quizzes.count > 0)
      ((raw_score / quiz.questions.count).round(2)) * 100
    else
      0
    end
  end  

  def self.highest_quiz_score(quiz)
    quiz = quiz.user_quizzes.max_by(&:num_correct)
    quiz.num_correct if quiz
  end

  def self.lowest_quiz_score(quiz)
    quiz = quiz.user_quizzes.min_by(&:num_correct)
    quiz.num_correct if quiz
  end

  def self.question_score_counts(quiz)
    quiz.approved_questions.inject({}) do |score_hash, question|
      score_hash.update(question => Answer.joins(:choice).where(:quiz_id => quiz.id, :question_id => question.id, :choices => {:is_correct => true}).count)
    end
  end

  def self.num_answers_for_choice(choice_id)
    Answer.where(:choice_id => choice_id).count
  end

  def self.num_answers_for_question(question_id)
    Answer.where(:question_id => question_id).count
  end
end