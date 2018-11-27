module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_topic

      def index
        render json: @topic.messages
      end

      def create
        message = @topic.messages.new(message_params.merge(user: current_user))

        if message.save
          render json: message, status: 201
        else
          render json: message.errors
        end
      end

      private

      def set_topic
        @topic = Topic.find(params[:topic_id])
      end

      def message_params
        params.require(:message).permit(:text)
      end
    end
  end
end
