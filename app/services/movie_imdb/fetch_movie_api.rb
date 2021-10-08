
module MovieImdb
  class FetchMovieApi
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      info_movies = fetch_info_movies


      movie_ids = info_movies.map do |info_movie|
        gender = Gender.find_or_create_by(name: info_movie["Type"])
        movie = Movie.find_or_initialize_by(name: info_movie["Title"])
        movie.gender_id = gender.id

        if movie.save
          movie.id
        else
          errors.add(:base, movie.errors)
        end
      end
    end

    def fetch_info_movies
      info_movies = @params.map do |movie_params|
        headers = {"X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com", "X-RapidAPI-Key" => ENV["KEY_API_MOVIES"]}
        query = { "s" => movie_params[:name], "page" => "1" }
        res = HTTParty.get("https://movie-database-imdb-alternative.p.rapidapi.com", query: query, headers: headers )

        response_body = Oj.load(res.body)
        p response_body
        response_body["Search"].first
      end
    end
  end
end