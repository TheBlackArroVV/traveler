module ApiDoc
  module V1
    module Trips
      extend Dox::DSL::Syntax

      document :api do
        resource 'Trips' do
          endpoint '/trips'
          group 'Trips'
        end
      end

      document :index do
        action 'Get a trips'
      end

      document :show do
        action 'Get a trip'
      end

      document :create do
        action 'Create a trip'
      end

      document :update do
        action 'Update a trip'
      end

      document :destroy do
        action 'Delete a trip'
      end

      document :join do
        action 'Join to trip'
      end
    end
  end
end
