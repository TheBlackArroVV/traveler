module Api
  module Admin
    class UsersController < AdminsController
      before_action :set_user, only: :index

      def index
        render json: User.all
      end

      def destroy
        @user.destroy

        render json: {}
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
