class Event < ApplicationRecord
  validates :title, :body, :location, :date, presence: true

  belongs_to :creator, class_name: "User"
  has_many :users, through: :enrollments
end
