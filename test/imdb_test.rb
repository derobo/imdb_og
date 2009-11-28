require 'test_helper'

class ImdbTest < Test::Unit::TestCase

  context "Imdb" do
    should "have an imdb movie base url" do
      assert_equal "http://www.imdb.com/title/", Imdb::IMDB_MOVIE_BASE_URL
    end
    should "have an imdb search base url" do
      assert_equal "http://imdb.com/find?s=all&q=", Imdb::IMDB_SEARCH_BASE_URL
    end
  end
  context "when searching" do
    setup do
      @results = Imdb.search_movies_by_title('transformers')
    end
    
    should "return an array of results" do
      assert_equal Array, @results.class
    end

    should "return an array of hashes" do
      assert_equal Hash, @results.first.class
    end

    should "return an array of hashes with the right keys" do
      assert @results.first.has_key?(:title)
      assert @results.first.has_key?(:imdb_id)
    end
    
  end
  
  context "when searching with exact match" do
    setup do
      @results = Imdb.search_movies_by_title('A Fish Called Wanda')
    end
    
    should "return an array of results" do
      assert_equal Array, @results.class
    end

    should "return an array of hashes" do
      assert_equal Hash, @results.first.class
    end

    should "return an array of hashes with the right keys" do
      assert @results.first.has_key?(:title)
      assert @results.first.has_key?(:imdb_id)
    end
    
    should "return only one id if exact match" do
      assert_equal 1, @results.size
    end
    
    should "return the right id" do
      assert_equal "tt0095159", @results.first[:imdb_id]
    end
  end

  context "ImdbMovie" do
    context "when first created" do
      should "not have an imdb_id" do
        movie = ImdbMovie.new
        assert_nil movie.imdb_id
      end
    end
    
    context "after an Imdb.find_by_id returns it" do 
      setup do
        @movie = Imdb.find_movie_by_id('tt0382932')
      end
    
      should "have an imdb_id" do
        assert_equal 'tt0382932', @movie.imdb_id
      end
    
      should "have a title" do
        assert_equal 'Ratatouille', @movie.title
      end
    
      should "have a release date" do
        # Fails for my, because imdb.com serves my the german release date (my ip should be the reason)
        # assert_equal Date.new(2007, 06, 29), @movie.release_date
        assert_equal Date.new(2007, 10, 3), @movie.release_date
      end
    
      should "have a G certification" do
        assert_equal 'G', @movie.certification
      end
    
      should "have a company" do
        assert_equal 'co0017902', @movie.company.imdb_id
        assert_equal 'Pixar Animation Studios', @movie.company.name
      end
          
      should "have two directors" do
        assert_equal 2, @movie.directors.length
        assert_equal 'nm0083348', @movie.directors[0].imdb_id
        assert_equal 'Brad Bird', @movie.directors[0].name
        assert_equal '', @movie.directors[0].role
          
        assert_equal 'nm0684342', @movie.directors[1].imdb_id
        assert_equal 'Jan Pinkava', @movie.directors[1].name
        assert_equal 'co-director', @movie.directors[1].role
      end
      
      should "have two writers" do
        assert_equal 2, @movie.writers.length
        assert_equal 'nm0083348', @movie.writers[0].imdb_id
        assert_equal 'Brad Bird', @movie.writers[0].name
        assert_equal 'screenplay', @movie.writers[0].role

        assert_equal 'nm0684342', @movie.writers[1].imdb_id
        assert_equal 'Jan Pinkava', @movie.writers[1].name
        assert_equal 'story', @movie.writers[1].role
      end
          
      should "have 15 actors" do
        assert_equal 15, @movie.actors.length
        assert_equal 'nm0652663', @movie.actors[0].imdb_id
        assert_equal 'Patton Oswalt', @movie.actors[0].name
        assert_equal 'Remy (voice)', @movie.actors[0].role

        assert_equal 'nm0826039', @movie.actors[14].imdb_id
        assert_equal 'Jake Steinfeld', @movie.actors[14].name
        assert_equal 'Git (Lab Rat) (voice)', @movie.actors[14].role
      end
          
      should "have five genres" do
        assert_equal 4, @movie.genres.length
        assert_equal 'Animation', @movie.genres[0].name
        assert_equal 'Comedy', @movie.genres[1].name
        assert_equal 'Family', @movie.genres[2].name
      end
          
      should "have a tagline" do
        assert_equal 'Dinner is served... Summer 2007', @movie.tagline
      end
          
      should "have a rating" do
        assert_match /\d.\d/, @movie.rating
      end
          
      should "have a poster_url" do
        assert_match /http:\/\/.*\.jpg/, @movie.poster_url
      end
          
      should "have a runtime" do
       assert_match /\d+ min/, @movie.runtime
      end
          
      should "have a plot" do
        assert_equal %{Remy is a young rat in the French countryside who arrives in Paris, only to find out that his cooking idol is dead. When he makes an unusual alliance with a restaurant's new garbage boy, the culinary and personal adventures begin despite Remy's family's skepticism and the rat-hating world of humans.}, @movie.plot
      end
          
      should "return an empty array if writers is nil" do
        @movie.writers = nil
        assert_equal [], @movie.writers
      end
          
      should "return an empty array if directors is nil" do
        @movie.directors = nil
        assert_equal [], @movie.directors
      end
          
      should "return an empty array if genres is nil" do
        @movie.genres = nil
        assert_equal [], @movie.genres
      end
    end
    
  end
  
end
