module Api
  module V1
    class ImagesController < ApplicationController
      def upload
        post = Post.find(params[:post_id])
        image_params[:images].each do |image|
          Image.create(image: image, post: post)
        end

        render json: {}, status: 201
      end

      private

      def image_params
        params.require(:images).permit(images: [])
      end
    end
  end
end
