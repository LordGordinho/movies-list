require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
  class GendersSearch < Resolvers::Base
    include SearchObject.module(:graphql)
    
    type [Types::GenderType], null: false

    scope { Movie.all }
  end
end