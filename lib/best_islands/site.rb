class Island
  attr_accessor :island_name, :population, :language_spoken, :average_rent, :home_price, :cost_of_milk
  
  def initialize 
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
