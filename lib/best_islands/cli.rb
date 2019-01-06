class CLI 
  def call
    Scraper.scrape_island_attributes
    greeting
  end 
  
  def greeting
    input = nil 
    while input != "exit"
      puts "Welcome to 'The Top Best Islands To Live On'."
      puts ""
      puts "If you would like to see a list of 'The Top Best Islands To Live On' type 'islands'."
      if input == "islands"
        list_island_names 
      end
      puts ""
      puts  "If you would like to see a list of facts about an island type the island id number."
      if input.to_i > 0 && input.to_i < Island.all.length
        list_island_facts(input)
      end
      puts ""
      puts "If you would to read about an island, type 'description' followed by the island id number."
      #if input.split[0] == "description" && input.split[1].to_i > 0 && input.split[1].to_i < Island.all.length
       # island_description(input)
     # end
      puts "If you would like to view the disclaimer type 'disclaimer'."
      if input == "disclaimer"
        disclaimer 
      end
      puts ""
      puts "If you would like to exit, type 'exit'."
      puts ""
      input = gets.chomp
    end
  end
  
  def list_island_names
    Island.all.each_with_index do |island, index|
      puts "#{index + 1}. #{island.name}"
    end
  end
  
  def list_island_facts(id)
    isl = Island.all[id.to_i - 1]
    puts ""
    puts "#{id}. #{isl.name}."
    puts ""
    puts "  Population: #{isl.population}"
    puts "  Language spoken: #{isl.language_spoken}"
    puts "  The average rent for a one bedroom apartment: #{isl.average_rent}"
    puts "  The starting price for a home: #{isl.home_price}"
    puts "  The cost of a gallon of milk: #{isl.cost_of_milk}"
    puts ""
    puts "#{isl.paragraph_1}"
    puts "#{isl.paragraph_2}"
  end
  
  def island_description(input)
    id = input.split[1].to_i
    isl = Island.all[id]
    puts "#{isl.paragraph_1}"
    puts "#{isl.paragraph_2}"
  end
  
  # def disclaimer
  #   Scraper.scrape_for_disclaimer 
  # end
    
end