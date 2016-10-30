
require "themoviedb"
class Movies

	Tmdb::Api.key("7ff797c2799958357c0a45e8f65f45b2")	
	def initialize
		
	end
	
	def get_movie_by(title)
		@movie =Tmdb::Movie.find(title)
		@movie
	end

	def sort_by_date!(movies)
			movies.sort { |a, b| b.release_date <=> a.release_date}
	end

	def get_first_nine_movies!(movies)
		movies = movies[1...10]	
		movies
	end	



	def no_poster_movies!(movies)
		movies = movies.select do |movie|
			!movie.poster_path.nil?
		end
	end

	def get_movies(title)
		array_of_movies = get_movie_by(title)
		array_of_movies = no_poster_movies!(array_of_movies)
		array_of_movies = sort_by_date!(array_of_movies)
		array_of_movies = get_first_nine_movies!(array_of_movies)
		array_of_movies

	end
end


