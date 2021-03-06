module BestIslands
  class CLI
    def call
      Scraper.scrape_island_attributes
      Scraper.scrape_for_disclaimer
      greeting
    end

    def greeting
      input = nil
      while input != "exit"
        puts "Welcome to 'The Top Best Islands To Live On'."
        puts ""
        puts "If you would like to see a list of 'The Top Best Islands To Live On' type 'islands'."
        puts ""
        puts  "If you would like to see a list of facts about an island type the island id number."
        #if input.include?("description") # && input.split[1].to_i > 0 && input.split[1].to_i <= Island.all.length
         # island_description(input)
        #end
        puts ""
        puts "If you would like to view the disclaimer type 'disclaimer'."
        puts ""
        puts "If you would like to exit, type 'exit'."
        puts ""
        input = gets.chomp
        if input == "islands"
          puts ""
          list_island_names
        end
        if input.to_i > 0 && input.to_i <= Island.all.length
          puts ""
          list_island_facts(input)
        end
        if input == "disclaimer"
          puts ""
          disclaimer
        end
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
      if isl.currency
        puts "  Currency: #{isl.currency}"
      end
      if isl.temp
        puts "  Average year-round temp: #{isl.temp}"
      end
      puts ""
      puts "If you would like to read more about this island type y/n"
      input = gets.chomp
      if input == "y"
        island_description(id)
      end
    end

    def island_description(id)
      isl = Island.all[id.to_i - 1]
      puts "  #{id}. #{isl.name}"
      puts ""
      puts "  #{isl.paragraphs}"
      puts ""
    end

    def disclaimer
      puts "  #{Island.disclaimer}"
      puts ""
    end

  end
end
