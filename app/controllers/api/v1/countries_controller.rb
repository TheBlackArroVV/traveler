module Api
  module V1
    class CountriesController < ApplicationController
      def index
        render json: Country.all
      end
    end
  end
end
