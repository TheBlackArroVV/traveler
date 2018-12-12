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

      document :show do
        action 'Get a post'
      end
    end
  end
end
