class Event < ApplicationRecord
  validates :title, :body, :location, :date, presence: true

  belongs_to :creator, class_name: "User"
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user
end
