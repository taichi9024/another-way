class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :space, optional: true
end
