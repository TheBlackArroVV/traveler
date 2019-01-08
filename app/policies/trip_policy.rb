class TripPolicy < ApplicationPolicy
  def update?
    @user == @record.user
  end
end
