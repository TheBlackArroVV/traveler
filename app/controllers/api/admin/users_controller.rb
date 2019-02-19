module Api
  module Admin
    class UsersController < AdminsController
      before_action :set_user

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
