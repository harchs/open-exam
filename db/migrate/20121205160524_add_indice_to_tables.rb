class AddIndiceToTables < ActiveRecord::Migration
  def change
    add_index :questions, :quiz_id
    add_index :answers, :user_id
    add_index :choices, :question_id
  end
end
