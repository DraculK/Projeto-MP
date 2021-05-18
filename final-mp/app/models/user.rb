class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_quizzes, dependent: :destroy, class_name: 'Quiz',
                             foreign_key: 'creator_id', inverse_of: :creators

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 3, message: 'Nome deve ter ao menos 3 caracteres.' }
  has_many :quiz_users, dependent: :destroy
  has_many :quizzes, through: :quiz_users
  has_one_attached :image
end
