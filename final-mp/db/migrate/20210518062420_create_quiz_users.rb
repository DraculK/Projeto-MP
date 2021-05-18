class CreateQuizUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_users do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.float :grade

      t.timestamps
    end
  end
end
