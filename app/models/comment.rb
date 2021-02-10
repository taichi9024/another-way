class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :user_id, presence: true, numericality: true
  validates :space_id, presence: true, numericality: true
  validates :content, presence: true, length: { minimum: 10 }
end
