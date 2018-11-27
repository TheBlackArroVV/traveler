class Topic < ApplicationRecord
  belongs_to :user

  has_many :messages

  validates :title, :description, presence: true
end
