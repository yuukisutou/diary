class Event < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
