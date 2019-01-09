module ApiDoc
  module V1
    module Profiles
      extend Dox::DSL::Syntax

      document :api do
        resource 'Profiles' do
          endpoint '/profiles'
          group 'Profiles'
        end
      end

      document :index do
        action 'Get a profile'
      end

      document :update do
        action 'Update a profile'
      end
    end
  end
end
