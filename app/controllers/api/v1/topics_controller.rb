module Api
  module V1
    class TopicsController < ApplicationController
      before_action :set_topic, except: %i[index create]

      def index
        render json: Topic.all
      end

      def create
        topic = Topic.new(topic_params.merge(user: current_user))

        if topic.save
          render json: topic, status: 201
        else
          render json: topic.errors
        end
      end

      def show
        render json: @topic
      end

      def destroy
        authorize @topic

        @topic.destroy
        render json: {}
      end

      private

      def set_topic
        @topic = Topic.find(params[:id])
      end

      def topic_params
        params.require(:topic).permit(:title, :description)
      end
    end
  end
end
