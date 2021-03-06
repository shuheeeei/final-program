class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true, null: false
  validates :name, presence: true, uniqueness: true, null: false

  has_many :meigens
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :points, dependent: :destroy
end
