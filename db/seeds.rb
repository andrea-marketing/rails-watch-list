require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://tmdb.lewagon.com/movie/top_rated'

movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

results = movies['results']
poster_url = 'https://image.tmdb.org/t/p/w500/'

results.each do |movie|
  Movie.create(title: movie['original_title'],
               overview: movie['overview'],
               poster_url: poster_url + movie['poster_path'],
               rating: movie['vote_average'])
end

List.create(name: 'Romance')
List.create(name: 'Classics')
List.create(name: 'Musicals')
List.create(name: 'Comedy')
