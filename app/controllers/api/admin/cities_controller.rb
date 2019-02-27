module Api
  module Admin
    class CitiesController < AdminsController
      before_action :set_city, only: %i[update destroy]

      def index
        render json: City.all
      end

      def create
        city = City.new(city_params)

        if city.save
          render json: city, status: 201
        else
          render json: city.errors, status: 422
        end
      end

      def update
        if @city.update(city_params)
          render json: @city
        else
          render json: @city.errors, status: 422
        end
      end

      def destroy
        @city.destroy

        render json: {}
      end

      private

      def set_city
        @city = City.find(params[:id])
      end

      def city_params
        params.require(:city).permit(:name, :country_id)
      end
    end
  end
end
