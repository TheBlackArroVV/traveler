module Api
  module Admin
    class PostsController < AdminsController
      def index
        render json: Post.all
      end

      def destroy
        Post.find(params[:id]).destroy

        render json: {}
      end
    end
  end
end
