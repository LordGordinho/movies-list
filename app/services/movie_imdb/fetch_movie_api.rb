# res = HTTParty.get("https://movie-database-imdb-alternative.p.rapidapi.com", query: query, headers: headers )
query = { "s" => "Missão imposível", "page" => "1" }
{"X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com", "X-RapidAPI-Key" => ENV["KEY_API_MOVIES"}
