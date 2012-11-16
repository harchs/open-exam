class AddNumCorrectAndTotalQuestionsToUserQuiz < ActiveRecord::Migration
  def change
    add_column :user_quizzes, :num_correct, :integer
    add_column :user_quizzes, :total_questions, :integer
  end
end
