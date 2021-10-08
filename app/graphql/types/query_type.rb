module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :genders, resolver: Resolvers::GendersSearch
    # field :movies, resolver: Resolvers::MoviesSearch
    field :user, Types::UserType, null: false

    def user
      context[:current_user]
    end
  end
end
