module Api
  module V1
    class SightsController < ApplicationController
      before_action :set_sight, only: %i[show update destroy]

      def index
        render json: Sight.all
      end

      def create
        sight = Sight.new(sight_params)

        if sight.save
          render json: sight, status: 201
        else
          render json: sight.errors, status: 422
        end
      end

      def show
        render json: @sight
      end

      def update
        return render json: @sight if @sight.update(sight_params)

        render json: @sight.errors
      end

      def destroy
        @sight.destroy

        render json: {}
      end

      private

      def set_sight
        @sight = Sight.find(params[:id])
      end

      def sight_params
        params.require(:sight).permit(:name, :description, :city_id)
      end
    end
  end
end
