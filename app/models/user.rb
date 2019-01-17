class User < ApplicationRecord
  has_many :splayds, dependent: :nullify
  has_many :jobs,    dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :username, length: { in: 3..20 }, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }
end
