class User < ApplicationRecord

  has_many :spaces
  has_many :comments
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable,
         :omniauthable
  
  def self.find_of_create(auth)
    find_or_create_by!(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.provider = auth[:provider],
      user.uid = auth[:uid],
      user.name = auth[:info][:name],
      user.email= User.dummy_email(auth),
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
