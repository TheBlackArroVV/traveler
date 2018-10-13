class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  alias authenticate valid_password?

  has_one :profile, dependent: :destroy
  has_many :posts

  validates :phone_number, numericality: { only_integer: true }, allow_blank: true
end
