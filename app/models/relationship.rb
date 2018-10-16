class Relationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :room, class_name: "Room"
  validates :user, presence: true
  validates :room, presence: true
end
