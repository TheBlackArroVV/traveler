class Sight < ApplicationRecord
  has_many :images
  belongs_to :city

  validates :name, :description, presence: true
end
