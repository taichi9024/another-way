class Staff < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :password, presence: true
end
