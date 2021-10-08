module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :gender_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    field :gender, Types::GenderType, null: false
    field :status, String, null: true

    # def status
    #   p object.status
    # end
  end
end
