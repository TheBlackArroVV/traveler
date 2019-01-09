module ApiDoc
  module V1
    module Topics
      extend Dox::DSL::Syntax

      document :api do
        resource 'Topics' do
          endpoint '/topics'
          group 'Topics'
        end
      end

      document :index do
        action 'Get a topics'
      end

      document :show do
        action 'Get a topic'
      end

      document :create do
        action 'Create a topic'
      end

      document :update do
        action 'Update a topic'
      end

      document :destroy do
        action 'Delete a topic'
      end
    end
  end
end
