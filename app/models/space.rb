class Space < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  
  geocoded_by :city
  after_validation :geocode
end
