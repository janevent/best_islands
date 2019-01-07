class Island
  attr_accessor :name, :population, :language_spoken, :average_rent, :home_price, :cost_of_milk, :currency, :temp, :paragraph_1, :paragraph_2
  
  def initialize(name = nil) 
    @name = name
    @@all << self
  end
  
  @@all = [] 
  
  def self.all 
    @@all 
  end
  
  def self.find(id)
    self.all[id.to_i -1]
  end
  
end
