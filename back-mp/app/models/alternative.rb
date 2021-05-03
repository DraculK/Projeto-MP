class Alternative < ApplicationRecord
  validates :body, presence: true
  validates :body, uniqueness: { scope: :question_id, message: '- Alternativa repetida!'}
  belongs_to :question
end
