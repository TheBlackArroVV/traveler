module Api
  module Admin
    class MessagesController < AdminsController
      def index
        render json: Message.all
      end

      def destroy
        Message.find(params[:id]).destroy

        render json: {}
      end
    end
  end
end
