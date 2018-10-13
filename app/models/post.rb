class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :images

  belongs_to :user
end
