module Api
  module V1
    class CitiesController < ApplicationController
      def index
        render json: City.all
      end
    end
  end
end
