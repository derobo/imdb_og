require "lib/imdb"

puts "*********************"
puts "Find movie by IMDB ID"
puts "*********************"

m = Imdb.find_movie_by_id("tt0382932", true)

pp m.languages

puts "*** IMDB ID ***"
pp m.imdb_id
puts "*** Title ***"
pp m.title
puts "*** Release Year ***"
pp m.release_year
puts "*** Rating ***"
pp m.rating
puts "*** Poster URL ***"
pp m.poster_url
puts "*** Directors ***"
pp m.directors
puts "*** Awards ***"
pp m.awards
puts "*** Writers ***"
pp m.writers
puts "*** Company ***"
pp m.company
puts "*** Tagline ***"
pp m.tagline
puts "*** Runtime ***"
pp m.runtime
puts "*** Plot ***"
pp m.plot
puts "*** Genres ***"
pp m.genres
puts "*** Release Date ***"
pp m.release_date
puts "*** Certification ***"
pp m.certification
puts "*** Actors ***"
pp m.actors
puts "*** Languages ***"
pp m.languages
puts "*** Releases ***"
pp m.releases

puts "***********************"
puts "Search movie with title"
puts "***********************"

m = Imdb.search_movies_by_title("Hero")

pp m
