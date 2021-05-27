puts 'Creating movies'

require 'json'
require 'open-uri'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=25619a47ad61549b45f9e4ad7e456890&language=en-US&page=1'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies['results'].each do |movie|
    puts 'creating movie'
    Movie.create!(title: movie['original_title'],
         overview: movie['overview'], 
         poster_url: movie['poster_path'], 
         rating: movie['vote_average'])
    puts 'created movie'

end

puts 'finished creating movies'