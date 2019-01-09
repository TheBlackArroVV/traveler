module ApiDoc
  module V1
    module Sights
      extend Dox::DSL::Syntax

      document :api do
        resource 'Sights' do
          endpoint '/sights'
          group 'Sights'
        end
      end

      document :index do
        action 'Get a sights'
      end

      document :show do
        action 'Get a sight'
      end

      document :create do
        action 'Create a sight'
      end

      document :update do
        action 'Update a sight'
      end

      document :destroy do
        action 'Delete a sight'
      end

      document :like do
        action 'Like a sight'
      end

      document :dislike do
        action 'Dislike a sight'
      end
    end
  end
end
