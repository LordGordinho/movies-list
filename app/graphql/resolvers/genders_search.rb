module Resolvers
  class GendersSearch < Resolvers::Base
    # include SearchObject.module(:graphql)
    
    type [Types::GenderType], null: false

    
    def resolve
      Gender.all
    end
  end
end