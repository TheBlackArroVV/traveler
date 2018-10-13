module Api
  module V1
    class ImagesController < ApplicationController
      before_action :set_post

      def upload
        image_params[:images].each do |image|
          @post.images.create(image: image)
        end

        render json: {}, status: 201
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def image_params
        params.require(:images).permit(images: [])
      end
    end
  end
end
