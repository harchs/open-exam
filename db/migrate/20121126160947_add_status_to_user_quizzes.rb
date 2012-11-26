class AddStatusToUserQuizzes < ActiveRecord::Migration
  def change
    add_column :user_quizzes, :status, :text
  end
end
