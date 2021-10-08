module Types
  class MutationType < Types::BaseObject
    field :user, mutation: Mutations::UsersCreate
  end
end
