class Feedback < ApplicationRecord
  validates :content, presence: true, length: { minimum: 20 }
  validates :email, presence: true, "valid_email_2/email": true
end
