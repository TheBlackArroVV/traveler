module Api
  module V1
    module Users
      class ProfilesController < ApplicationController
        def index
          render json: current_user.profile
        end

        def update
          form_object = ProfileForm.new(profile_params.merge(user_id: current_user.id))

          render json: form_object.profile if form_object.save
        end

        private

        def profile_params
          params.require(:profile).permit(:about, :avatar)
        end
      end
    end
  end
end
