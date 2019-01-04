module Api
  module V1
    class TripsController < ApplicationController
      before_action :set_trip, except: %i[index create]

      def index
        render json: Trip.all
      end

      def create
        trip = Trip.new(trip_params.merge(user: current_user))

        if trip.save
          render json: trip, status: 201
        else
          render json: trip.errors
        end
      end

      def show
        render json: @trip
      end

      def join
        service = TripService.new(@trip, current_user)

        if service.join
          render json: {}
        else
          render json: service.errors
        end
      end

      def update
        if @trip.update(trip_params)
          render json: @trip
        else
          render json: @trip.errors
        end
      end

      def destroy
        @trip.destroy

        render json: {}
      end

      private

      def set_trip
        @trip = Trip.find(params[:id])
      end

      def trip_params
        params.require(:trip).permit(:description, :budget, :max_members, :city_id)
      end
    end
  end
end
