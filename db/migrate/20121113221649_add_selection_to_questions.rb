class AddSelectionToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :selected, :boolean, :default => false
  end

  def down
  end
end