class AddOrganizationIdToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :organization_id, :integer
  end
end
