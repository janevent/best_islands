class Island
  attr_accessor :name, :population, :language_spoken, :average_rent, :home_price, :cost_of_milk, :currency, :temp, :paragraphs, :disclaimer

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  @@all = []

  def self.all
    @@all
  end

  def self.disclaimer
    Scraper.scrape_for_disclaimer
  end

  def self.find(id)
    self.all[id.to_i -1]
  end

end
