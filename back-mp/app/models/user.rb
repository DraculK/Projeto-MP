class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validates :name, length: { minimum: 3, message: 'Nome deve ter ao menos 3 caracteres.'}
end
