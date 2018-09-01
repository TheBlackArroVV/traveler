class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  alias authenticate valid_password?

  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :authorizations

  validates :phone_number, numericality: { only_integer: true }, allow_blank: true

  def self.find_for_oauth(oauth)
    authorization = Authorization.find_by(provider: oauth[:provider], uid: oauth[:uid].to_s)
    return authorization.user if authorization

    email = oauth[:info][:email]
    user = User.find_by(email: email)
    unless user
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password)
    end
    user.authorizations.create(provider: oauth[:provider], uid: oauth[:uid].to_s)
    user
  end
end
