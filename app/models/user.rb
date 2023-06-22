class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :events, foreign_key: "creator_id", class_name: "Event"
end
