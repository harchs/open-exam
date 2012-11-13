class ChangeDefaultOfIsPublished < ActiveRecord::Migration
  def up
    change_column :quizzes, :is_published, :boolean, :default => false
  end

  def down
  end
end
