class ChangeNameTypeOnChoices < ActiveRecord::Migration
  def change
    change_column :choices, :name, :text
  end
end
