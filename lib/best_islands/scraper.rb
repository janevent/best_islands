# require 'pry'
class Scraper
  def scrape_page
    html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    @doc = Nokogiri::HTML(html)
  end
  
  def scrape_island_attributes
    names = scrape_page.css(".caption span")
    names.each do |name|
      island = Island.new 
      island.island_name = name.text
    end
    scrape_page.css(".list").each_with_index do |list, index|
      # binding.pry
      list[index].css("li").each_with_index do |fact, index|
        if fact.text.include?("Population")
          island.population = fact.text.split(": ")[1]
        elsif fact.text.include?("Language")
          island.language = fact.text.split(": ")[1]
        elsif fact.text.include?("rent")
          island.average_rent = fact.text.split(": ")[1]
        elsif fact.text.include?("home")
          island.home_price = fact.text.split(": ")[1]
        elsif fact.text.include?("milk")
          island.cost_of_milk = fact.text.split(": ")[1]
        end
      #if fact.text.include?("population")
        #island.population = fact.text.split(': ')[1]
      #end
      end
    end
  end
  
end
