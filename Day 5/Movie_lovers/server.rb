require "sinatra"
require "sinatra/reloader"
require "./lib/imdb"
require "./lib/quiz"

movies = Movies.new
quiz =  Quiz.new


$current_movies = ""

get '/' do


	erb :home
end

post "/movies" do
	title = params[:query]
	redirect to("/show_movies/#{title}")
end

get "/show_movies/?:title?" do
	title = params[:title]
	@movies = movies.get_movies(title)
	$current_movies = @movies

	erb :show_movies
end

post "/result" do
	answer = params[:quiz_answer]
	

	redirect("/result/#{answer}")
end


get "/result/?:answer/?" do 
	@answer = params[:answer]
	
	if quiz.answer_correct?($current_movies, @answer)
		@message = '<h1>You are absolutely correct</h1>'

	else 

		@message = '<h1>You are absolutely wrong</h1>'
		
		end

		erb :result
end

