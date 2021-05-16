class CreateQuizUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_users do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :grade

      t.timestamps
    end
  end
end
