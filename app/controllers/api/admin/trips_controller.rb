module Api
  module Admins
    class TripsController < AdminsController
      def index
        render json: Trip.all
      end

      def destroy
        Trip.find(params[:id]).destroy
      end
    end
  end
end
