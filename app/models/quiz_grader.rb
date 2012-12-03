class QuizGrader
  def self.num_correct(answers, quiz)
    (answers.map(&:choice_id) & quiz.correct_choices.map(&:id)).count
  end

  def self.average_quiz_score(quiz)
    scores = quiz.completed
    scores = scores.collect{|user_quiz| user_quiz.num_correct}
    quiz.user_quizzes.count > 0 ? scores.sum.to_f / quiz.completed.count : 0
  end  

  def self.percent_correct(quiz)
    raw_score = average_quiz_score(quiz).to_f
    quiz.user_quizzes.count > 0 ? ((raw_score / quiz.questions.count).round(2)) * 100 : 0
  end  

  def self.highest_quiz_score(quiz)
    user_quiz = quiz.completed
    user_quiz = user_quiz.max_by(&:num_correct)
    user_quiz.num_correct if user_quiz
  end

  def self.lowest_quiz_score(quiz)
    user_quiz = quiz.completed
    user_quiz = user_quiz.min_by(&:num_correct)
    user_quiz.num_correct if user_quiz
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

  def self.hardest_question_author(quiz)
    hardest = question_score_counts(quiz).values.min
    question_score_counts(quiz).key(hardest).author.name
  end  

  def self.hardest_question(quiz)
    hardest = question_score_counts(quiz).values.min
    question_score_counts(quiz).key(hardest).name
  end 

  def self.most_correct_answers(quiz)
    most = quiz.completed
    most = most.max_by(&:num_correct)
    User.find_by_id(most.user_id).name
  end  

  def self.correct_responses(quiz)
    most = quiz.completed
    most = most.max_by(&:num_correct)
    most.num_correct
  end 

  def self.student_correct_percent_by_quiz(quiz)
    #for quiz passed in, get score for each user who has taken quiz and return an array
    quiz.completed.map { |q|  (q.num_correct.to_f / q.total_questions.to_f)*100 }
  end 
end