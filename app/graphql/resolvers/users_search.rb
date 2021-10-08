module Resolvers
  class User::Search < Resolvers::Base
    include SearchObject.module(:graphql)
    
    type [Types::User], null: false

    def resolve
      User.all
    end
  end
end