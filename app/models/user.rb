class User < ApplicationRecord
  has_many :spaces, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :books, dependent: :destroy

  after_destroy do
    Rails.logger.info "ユーザーが退会しました　#{attribute}"
  end

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, "valid_email_2/email": true

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
