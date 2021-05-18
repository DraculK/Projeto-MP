class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.float :grade
      t.boolean :anonymous?
      t.references :creator

      t.timestamps
    end
  end
end
