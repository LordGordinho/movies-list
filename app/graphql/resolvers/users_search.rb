module Resolvers
  class UsersSearch < Resolvers::Base
    include SearchObject.module(:graphql)
    
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end