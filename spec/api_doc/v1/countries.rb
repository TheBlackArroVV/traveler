module ApiDoc
  module V1
    module Countries
      extend Dox::DSL::Syntax

      document :api do
        resource 'Countries' do
          endpoint '/countries'
          group 'Countries'
        end
      end

      document :index do
        action 'Get a Countries'
      end
    end
  end
end
