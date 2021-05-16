class CreateAlternatives < ActiveRecord::Migration[6.1]
  def change
    create_table :alternatives do |t|
      t.string :body
      t.boolean :correct_answer?

      t.timestamps
    end
  end
end
