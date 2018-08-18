module Api
  module V1
    module Users
      class ProfilesController < ApplicationController
        def create
          form_object = ProfileForm.new(params)
          if form_object.save
            render json: form_object, status: 200
          else
            render json: form_object.errors, status: 422
          end
        end
      end
    end
  end
end
