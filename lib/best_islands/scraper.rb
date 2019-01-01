require 'pry'
class Scraper
  def scrape_page
    html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    @doc = Nokogiri::HTML(html)
  end
  
  def scrape_island_attributes
    names = scrape_page.css(".caption span")
    binding.pry
    names.each do |name|
      island = Island.new 
      island.island_name = name.text
    end
    lists = scrape_page.css(".list")
    lists.each do |list|
      list.css("li").each do |item|
        if item.include?("population")
          island.population = item.text.split(': ')[1]
        end
      end
    end
  end
  
end
