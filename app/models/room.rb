class Room < ApplicationRecord
  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "room_id", dependent:   :destroy
  has_many :users, through: :active_relationships, source: :user
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 256}
end
