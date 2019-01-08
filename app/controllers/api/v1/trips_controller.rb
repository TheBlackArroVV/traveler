module Api
  module V1
    class TripsController < ApplicationController
      before_action :set_trip, except: %i[index create]
      before_action :set_trip_service, only: %i[create join]

      def index
        render json: Trip.all
      end

      def create
        if @service.create(trip_params)
          render json: @service.trip, status: 201
        else
          render json: @service.errors
        end
      end

      def show
        render json: @trip
      end

      def join
        if @service.join
          render json: {}
        else
          render json: @service.errors
        end
      end

      def update
        authorize @trip

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

      def set_trip_service
        @service = TripService.new(current_user, @trip)
      end
    end
  end
end
