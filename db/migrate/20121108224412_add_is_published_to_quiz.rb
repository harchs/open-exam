class AddIsPublishedToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :is_published, :boolean
  end
end
