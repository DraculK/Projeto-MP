class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :statement
      t.string :category
      t.float :grade

      t.timestamps
    end
  end
end
