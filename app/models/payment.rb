class Payment < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, numericality: true
  validates :owner, presence: true, length: { maximum: 20 }
  validates :placename, presence: true, length: { maximum: 30 }
  validates :price, presence: true, numericality: true
end
