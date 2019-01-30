require 'pry'

class Scraper
  
  def self.scrape_page
    # html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    # @doc = Nokogiri::HTML(html)
    @browser = CapybaraScraper::Browser.new.visit("https://www.islands.com/top-20-best-islands-to-live-on/")
   # @browser.page.find("#article-body")
  end
  
  def self.scrape_island_attributes
    #lis = @browser.page.find("#article-body > li") 
    last_island = nil
    lis = scrape_page.css("article-body> li")
    
    paragraph_array = []
    lis.each do |li|
     # binding.pry
      if li.css(".caption span").length > 0 
        last_island = Island.new(li.css(".caption span").first.text)
      elsif last_island != nil && li.css(".paragraph").length > 0  && li.css(".paragraph").text.include?("Real Estate Tips") == false && li.css(".paragraph").text.include?("Red Frog") == false
        paragraph_array << li.css(".paragraph").text
        last_island.paragraph_1 = paragraph_array[0]
        last_island.paragraph_2 = paragraph_array[1]
        if paragraph_array.length == 2 
          paragraph_array.clear
        end
        
        #last_island.paragraph_1 = li.css(".paragraph").text
        #last_island.paragraph_2 = li.css(".paragraph").text
      #elsif last_island.paragraph_1.length > 1 && li.css(".paragraph").length > 0
        #last_island.paragraph_2 = li.css(".paragraph")
      elsif li.text.include?("Population:")
        li.css(".list li").each do |fact|
          if fact.text.include?("Population")
            last_island.population = fact.text.split(": ")[1]
          elsif fact.text.include?("Language")
            last_island.language_spoken = fact.text.split(": ")[1]
          elsif fact.text.include?("Currency")
            last_island.currency = fact.text.split(": ")[1]
          elsif fact.text.include?("temp")
            last_island.temp = fact.text.split(": ")[1]
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
    @browser.find.page("#article-body > li").first.text
  end
  
end
