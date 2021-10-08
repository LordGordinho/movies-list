module Types
  class MutationType < Types::BaseObject
    field :user, mutation: Mutations::UsersCreate
    field :user_update, mutation: Mutations::UsersUpdate
  end
end
