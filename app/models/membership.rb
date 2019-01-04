class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user_id, uniqueness: { scope: %i[user_id trip_id] }

  validate :free_places

  def free_places
    return if trip.max_members > (Membership.where(trip: trip).try(:count) || 0)

    errors[:base] << 'Already max members in trip'
  end
end
