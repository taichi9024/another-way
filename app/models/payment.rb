class Payment < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, numericality: true
  validates :owner, presence: true
  validates :placename, presence: true
  validates :price, presence: true, numericality: true

end
