module ApiDoc
  module V1
    module Posts
      extend Dox::DSL::Syntax

      document :api do
        resource 'Posts' do
          endpoint '/posts'
          group 'Posts'
        end
      end

      document :index do
        action 'Get a posts'
      end

      document :show do
        action 'Get a post'
      end

      document :create do
        action 'Create a post'
      end

      document :update do
        action 'Update a post'
      end

      document :destroy do
        action 'Delete a post'
      end
    end
  end
end
