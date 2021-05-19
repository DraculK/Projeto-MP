class Quiz < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :title, presence: true
  validates :anonymous?, inclusion: { in: [true, false],
                                      message: 'Informe se o questionário pode ser respondido por usuários anônimos!' }
  validate :is_creator?

  has_many :questions, dependent: :destroy
  has_many :quiz_users, dependent: :destroy
  has_many :users, through: :quiz_users
  has_one_attached :image

  def is_creator?
    unless User.exists?(creator_id) && User.find(creator_id).creator
      errors.add(:not_creator, '- Id de usuário não corresponde a um usuário criador de questionário!')
    end
  end
end
