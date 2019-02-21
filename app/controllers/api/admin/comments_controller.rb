module Api
  module Admin
    class CommentsController < AdminsController
      def index
        render json: Comment.all
      end

      def destroy
        Comment.find(params[:id]).destroy

        render json: {}
      end
    end
  end
end