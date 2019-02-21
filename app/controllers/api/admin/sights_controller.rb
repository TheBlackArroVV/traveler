module Api
  module Admins
    class SightsController < AdminsController
      def index
        render json: Sight.all
      end

      def destroy
        Sight.find(params[:id]).destroy

        render json: {}
      end
    end
  end
end
