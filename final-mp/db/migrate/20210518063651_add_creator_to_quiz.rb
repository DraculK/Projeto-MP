class AddCreatorToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :quizzes, :users, column: :creator_id, primary_key: :id
  end
end
