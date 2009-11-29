class ImdbMovie
  attr_accessor :imdb_id, :title, :directors, :writers, :akas, :releases, :tagline, :company, :plot, :runtime, :rating, :poster_url, :release_date, :certification, :genres, :actors

  def writers
     self.instance_variable_get(:@writers) || []
  end

  def actors
     self.instance_variable_get(:@actors) || []
  end

  def directors
    self.instance_variable_get(:@directors) || []
  end
  
  def genres
    self.instance_variable_get(:@genres) || []
  end
  
  def akas
    self.instance_variable_get(:@akas) || []
  end
  
  def releases
    self.instance_variable_get(:@releases) || []
  end
end
