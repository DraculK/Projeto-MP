class Quiz < ApplicationRecord
  validates :title, :creator_id, presence: true
  validate :creator_exists

  has_many :questions, dependent: :destroy
  has_many :quiz_users, dependent: :destroy
  has_many :users, through: :quiz_users

  def creator_exists
    unless User.exists?(creator_id) && User.find(creator_id).creator
      errors.add(:not_creator, '- Id de usuário não corresponde a um usuário criador de questionário!')
    end
  end
end
