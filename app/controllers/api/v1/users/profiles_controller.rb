module Api
  module V1
    module Users
      class ProfilesController < ApplicationController
        def create
          form_object = ProfileForm.new(profile_params.merge(user_id: current_user.id))
          if form_object.save
            render json: form_object, status: 200
          else
            render json: form_object.errors, status: 422
          end
        end

        private

        def profile_params
          params.require(:profile).permit(:about, :avatar)
        end
      end
    end
  end
end
