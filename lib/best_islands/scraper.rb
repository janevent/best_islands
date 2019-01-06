require 'pry'

class Scraper
  
  def self.scrape_page
    html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    @doc = Nokogiri::HTML(html)
  end
  
  def self.scrape_island_attributes
    last_island = nil
    lis = scrape_page.css("#article-body > li")
    lis.each do |li|
     # binding.pry
      if li.css(".caption span").length > 0 
        last_island = Island.new(li.css(".caption span").first.text)
      elsif last_island != nil && li.css(".paragraph").length > 0
        last_island.paragraph_1 = li.css(".paragraph").text
        last_island.paragraph_2 = li.css(".paragraph").text
      binding.pry
      #elsif last_island.paragraph_1.length > 1 && li.css(".paragraph").length > 0
        #last_island.paragraph_2 = li.css(".paragraph")
      elsif li.text.include?("Population:")
        li.css(".list li").each do |fact|
          if fact.text.include?("Population")
            last_island.population = fact.text.split(": ")[1]
          elsif fact.text.include?("Language")
            last_island.language_spoken = fact.text.split(": ")[1]
          elsif fact.text.include?("rent")
            last_island.average_rent = fact.text.split(": ")[1]
          elsif fact.text.include?("home")
            last_island.home_price = fact.text.split(": ")[1]
          elsif fact.text.include?("milk")
            last_island.cost_of_milk = fact.text.split(": ")[1]
          end
        end
      end
    end
  end

  def self.scrape_for_disclaimer
    scrape_page.css("em").text
  end
  
end
