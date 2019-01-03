class Trip < ApplicationRecord
  belongs_to :city

  validates :budget, :max_members, :description, presence: true
end
