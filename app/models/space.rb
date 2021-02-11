class Space < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  geocoded_by :city
  after_validation :geocode

  validates :name, presence: true, length: { maximum: 20 }
  validates :pref, presence: true, length: { maximum: 8 }
  validates :city, presence: true, length: { maximum: 20 }
  validates :detailaddress, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, numericality: true
  validates :station, presence: true, length: { maximum: 10 }
  validates :station_walk, presence: true, numericality: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true, numericality: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 50} 
  validates :seat, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0} 
  validates :image,
            content_type: %i[png jpg jpeg],
            size: { less_than_or_equal_to: 10.megabytes }
end
