require 'pry'
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
    scrape_page.css(".list li").each do |fact|
      if fact.text.include?("population")
        island.population = fact.text.split(': ')[1]
      end
    end
  end
  
end
