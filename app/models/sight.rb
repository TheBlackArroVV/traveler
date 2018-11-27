class Sight < ApplicationRecord
  belongs_to :city

  validates :name, :description, presence: true
end
