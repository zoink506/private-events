class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # Creator association
  has_many :events, foreign_key: "creator_id", class_name: "Event"

  # Attendees association
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event
end
