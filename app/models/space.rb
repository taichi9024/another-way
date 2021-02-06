class Space < ApplicationRecord
  belongs_to :user
  has_many :comments

  geocoded_by :city
  after_validation :geocode
end
