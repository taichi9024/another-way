class Space < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  geocoded_by :city
  after_validation :geocode
  after_destroy :log_destroy
  
  validates :name, presence: true
  validates :pref, presence: true
  validates :city, presence: true
  validates :detailaddress, presence: true
  validates :tel, presence: true, numericality: true
  validates :station, presence: true
  validates :station_walk, presence: true, numericality: true
  validates :description, presence: true
  validates :user_id, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :seat, presence: true, numericality: true


  private
  def log_destroy
    puts "#{@space.name}を削除しました"
  end
end
