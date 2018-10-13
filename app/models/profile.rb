class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  validates :user_id, uniqueness: true
end
