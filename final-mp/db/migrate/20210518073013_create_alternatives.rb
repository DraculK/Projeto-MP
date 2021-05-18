class CreateAlternatives < ActiveRecord::Migration[5.2]
  def change
    create_table :alternatives do |t|
      t.string :body
      t.boolean :correct_answer?
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
