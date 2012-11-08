class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
      t.boolean :is_correct
      t.integer :question_id

      t.timestamps
    end
  end
end
