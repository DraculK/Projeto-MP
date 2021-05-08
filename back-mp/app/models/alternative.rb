class Alternative < ApplicationRecord
  validates :body, presence: true
  validates :body, uniqueness: { scope: :question_id, message: '- Alternativa repetida!' }
  validates :correct_answer?,
            presence: { scope: :question_id, if: :gradeble_question?,
                        message: '- Essa questão vale nota. Informe se a alternativa está correta ou não!' }
  belongs_to :question

  def gradeble_question?
    return false if Question.find(question_id).grade.nil?

    true
  end
end
