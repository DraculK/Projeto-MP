class RenameCorrectAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :alternatives, :correct_answer?, :correct_answer
  end
end
