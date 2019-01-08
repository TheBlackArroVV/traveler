class TripService
  attr_reader :errors, :trip

  def initialize(user, trip = {})
    @trip = trip
    @user = user
    @errors = []
  end

  def create(params)
    ActiveRecord::Base.transaction do
      @trip = Trip.new(params.merge(user: @user))

      if @trip.save
        Membership.create(user: @user, trip: @trip)
        true
      else
        @errors = @trip.errors
        false
      end
    end
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
