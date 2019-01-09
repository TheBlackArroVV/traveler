module ApiDoc
  module V1
    module Cities
      extend Dox::DSL::Syntax

      document :api do
        resource 'Cities' do
          endpoint '/cities'
          group 'Cities'
        end
      end

      document :index do
        action 'Get a Cities'
      end
    end
  end
end
