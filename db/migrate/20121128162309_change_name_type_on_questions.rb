class ChangeNameTypeOnQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :name, :text
  end
end
