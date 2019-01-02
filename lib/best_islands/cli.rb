class CLI 
  def call
    greeting
  end 
  
  def greeting
    input = nil 
    while input != "exit"
      puts "Welcome to 'The Top Best Islands To Live On'."
      puts "If you would like to see a list of 'The Top Best Islands To Live On' type 'islands'."
      if input == "islands"
        list_island_names 
      end
      puts  "If you would like to see a list of facts about an island type the island id number."
      if input.to_i > 0 && input.to_i < Island.all.length
        list_island_facts(input)
      end
      puts "If you would like to view the disclaimer type 'disclaimer'."
      if input == "disclaimer"
        disclaimer 
      end
      puts "If you would like to exit, type 'exit'."
      input = gets.chomp
    end
  end
  
  def list_island_names
    Island.all.each_with_index do |island, index|
      puts "#{index + 1}. #{island.island_name}"
    end
  end
  
  def list_island_facts(id)
    isl = Island.all[id.to_i -1]
    puts "#{id}. #{isl.island_name}."
    puts "Population: #{isl.population}"
    puts "Language spoken: #{isl.language_spoken}"
    puts "The average rent for a one bedroom apartment: #{average_rent}"
    puts "The starting price for a home: #{isl.home_price}"
    puts "The cost of a gallon of milk: #{isl.cost_of_milk}"
  end
  
  def disclaimer
    Scraper.scrape_for_disclaimer 
  end
    
end