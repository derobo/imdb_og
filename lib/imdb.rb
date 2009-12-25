require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'date'
require 'cgi'
require 'htmlentities'

%w(
  imdb/imdb
  imdb/imdb_company
  imdb/imdb_movie
  imdb/imdb_name
  imdb/imdb_genre
  imdb/patches
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end
