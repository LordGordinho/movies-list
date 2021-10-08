module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :password_digest, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :id, ID, null: true
    field :nome, String, null: false
    field :email, String, null: false
    field :movies, [Types::MovieType], null: true
    field :movies_watched, [Types::MovieType], null: true
    field :movies_to_watch, [Types::MovieType], null: true

    def movies
      Oj.load(query_movies.to_json)
    end

    def movies_to_watch
      movies = query_movies.where("user_movies.status = 0").to_json

      Oj.load(movies)
    end

    def movies_watched
      movies = query_movies.where("user_movies.status = 1").to_json

      Oj.load(movies)
    end

    def query_movies
      UserMovie.joins(:user, :movie).where(users: { id: object.id}).select("movies.*, user_movies.status")
    end
  end
end
