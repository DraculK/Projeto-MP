class Question < ApplicationRecord
  validates :statement, presence: true
  validates :category,
            inclusion: { in: ['Múltipla escolha', 'Verdadeiro/Falso', 'Dissertativa'],
                         message: ' - %<value>s não é uma categoria válida! '\
                         'Escolha entre Múltipla escolha, Verdadeiro/Falso e Dissertativa' }
  has_many :alternatives, dependent: :restrict_with_exception
end
