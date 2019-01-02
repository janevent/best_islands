class CLI 
  def call
    list_island_names
    list_island_facts
  end 
  
  def greeting
    input = nil 
    while input != "exit"
      puts "Welcome to 'The Top Best Islands To Live On'."
      puts "If you would like to see a list of 'The Top Best Islands To Live On' type 'islands'.
      if input == "islands"
        list_island_names 
      end
      puts  "If you would like to see a list of facts about an island type the island's id number."
      if input.to_i > 0 && input.to_i < Island.all.size
        list_island_facts(input)
      end
      puts "If you would like to exit, type "exit".
        #if input == "exit"
          #break
        #end
      input = gets.chomp
    end
  end
  
end