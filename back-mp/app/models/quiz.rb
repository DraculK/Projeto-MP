class Quiz < ApplicationRecord
  has_many :questions, dependent: :restrict_with_exception
  has_many :quiz_users
  has_many :users, through: :quiz_users
end
