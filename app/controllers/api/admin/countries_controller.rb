module Api
  module Admin
    class CountriesController < AdminsController
      before_action :set_country, only: %i[update destroy]

      def index
        render json: Country.all
      end

      def create
        country = Country.new(country_params)

        if country.save
          render json: country, status: 201
        else
          render json: country.errors, status: 422
        end
      end

      def update
        if @country.update(country_params)
          render json: @country
        else
          render json: @country.errors, status: 422
        end
      end

      def destroy
        @country.destroy

        render json: {}
      end

      private

      def set_country
        @country = Country.find(params[:id])
      end

      def country_params
        params.require(:country).permit(:name)
      end
    end
  end
end
