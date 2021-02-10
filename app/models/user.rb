class User < ApplicationRecord
  has_many :spaces
  has_many :comments
  has_many :likes
  has_many :payments

  validates :name, presence: true, length: { maximum: 20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable,
         :omniauthable

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider],
               uid = auth_hash[:uid],
               nickname = auth_hash[:info][:nickname] || auth_hash[:info][:name],
               email = User.dummy_email(auth_hash) || auth_hash[:info][:email],
               password = Devise.friendly_token[0, 20]

    User.find_or_create_by!(email: email) do |user|
      user.name = nickname
      user.email = email
      user.password = password
    end
  end

  def self.dummy_email(auth_hash)
    "#{auth_hash.uid}-#{auth_hash.provider}@example.com"
  end
end
