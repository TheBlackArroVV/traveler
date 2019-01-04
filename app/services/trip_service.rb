class TripService
  attr_reader :errors

  def initialize(trip, user)
    @trip = trip
    @user = user
    @errors = []
  end

  def join
    membership = Membership.new(trip: @trip, user: @user)

    if membership.save
      true
    else
      @errors = membership.errors
      false
    end
  end
end
