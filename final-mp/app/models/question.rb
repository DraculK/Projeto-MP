class Question < ApplicationRecord
  belongs_to :quiz
  validates :statement, presence: true
  validate :statement, uniqueness: { scope: :quiz_id, message: '- Questão repetida!' }
  validates :category,
            inclusion: { in: ['Múltipla escolha', 'Verdadeiro/Falso', 'Dissertativa'],
                         message: ' - %<value>s não é uma categoria válida! '\
                         'Escolha entre Múltipla escolha, Verdadeiro/Falso e Dissertativa' }
  validates :grade, presence: { scope: :quiz_id, if: :gradeble_quiz?,
                                message: '- Esse quiz vale nota. Informe o valor da questão!' }
  has_many :alternatives, dependent: :destroy

  def gradeble_quiz?
    return false if Quiz.find(quiz_id).grade.nil?

    true
  end
end
