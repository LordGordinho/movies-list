class Mutations::UsersCreate < Mutations::BaseMutation

  argument :name, String, required: true
  argument :email, String, required: false
  argument :password, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**attributes)
    user = User.new(attributes)

    if user.save
      {
        user: user,
        errors: [],
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end