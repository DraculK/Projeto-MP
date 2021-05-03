class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.float :grade
      t.bigint :creator_id

      t.timestamps
    end
  end
end
