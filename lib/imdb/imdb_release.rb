class ImdbRelease
  attr_accessor :country, :title, :date, :note
  
  def initialize(country, date)
    self.country = country
    self.date = date
  end  
end