module Api
  module V1
    module Users
      class ProfilesController < ApplicationController
        def create
          form_object = ProfileForm.new(profile_params.merge(user_id: current_user.id))

          render json: form_object.profile, status: 201 if form_object.save
        end

        private

        def profile_params
          params.require(:profile).permit(:about, :avatar)
        end
      end
    end
  end
end
