class Payment < ApplicationRecord
  belongs_to :user, optional: true
  before_save :price2netincome

  validates :user_id, presence: true, numericality: true
  validates :owner, presence: true, length: { maximum: 20 }
  validates :placename, presence: true, length: { maximum: 30 }
  validates :price, presence: true, numericality: true

  private

  def price2netincome
    self.netincome = price * 0.3
  end
end
