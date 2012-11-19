class AddPassingGradeToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :passing_grade, :integer
  end
end
