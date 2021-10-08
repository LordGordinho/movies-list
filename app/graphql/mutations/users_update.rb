class Mutations::UsersUpdate < Mutations::BaseMutation

  argument :id, ID, required: true
  argument :name, String, required: false
  argument :email, String, required: false
  argument :password, String, required: false
  argument :movie_ids, [ID], required: false
  argument :movie_params, [Types::Input::MovieParams], required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(movie_params:, id:, **attributes)
    service = MovieImdb::FetchMovieApi.call(movie_params)
    
    attributes[:movie_ids] += service.result if service.success?

    user = User.find_by(id: id)

    if user.update(attributes)
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