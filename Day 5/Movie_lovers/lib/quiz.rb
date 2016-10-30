class Quiz
	
	def answer_correct?(movies,answer)
		answer.capitalize == movies[0].title
	end

end