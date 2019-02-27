module Api
  module Admin
    class AdminsController < ApplicationController
      before_action :user_admin?

      private

      def user_admin?
        render json: { errors: { text: 'nothing there' } }, status: 404 unless current_user.admin?
      end
    end
  end
end
