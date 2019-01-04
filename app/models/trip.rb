class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :budget, :max_members, :description, presence: true
end
