class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :space, optional: true

  validates :user_id, presence: true, numericality: true
  validates :space_id, presence: true, numericality: true
end
