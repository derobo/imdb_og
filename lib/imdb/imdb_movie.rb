class ImdbMovie
  attr_accessor :imdb_id, :color, :title, :directors, :writers, :releases, :release_year, :tagline, :company, :plot, :runtime, :rating, :poster_url, :release_date, :certification, :genres, :actors, :awards, :aka

  def writers
     self.instance_variable_get(:@writers) || []
  end

  def actors
     self.instance_variable_get(:@actors) || []
  end

  def awards
     self.instance_variable_get(:@awards) || []
  end

  def directors
    self.instance_variable_get(:@directors) || []
  end
  
  def genres
    self.instance_variable_get(:@genres) || []
  end
  
  def releases
    self.instance_variable_get(:@releases) || {}
  end
end
