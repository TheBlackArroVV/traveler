module Api
  module Admin
    class TopicsController < AdminsController
      def index
        render json: Topic.all
      end

      def destroy
        Topic.find(params[:id]).destroy

        render json: {}
      end
    end
  end
end
