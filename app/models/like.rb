class Like < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :user_id, presence: true, numericality: true
  validates :space_id, presence: true, numericality: true

end
