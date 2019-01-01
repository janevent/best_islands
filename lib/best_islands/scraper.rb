require 'pry'
class Scraper
  def scrape_page
    html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    doc = Nokogiri::HTML(html)
  end
  
  def scrape_island_attributes
    names = doc.css(".caption span").text
    binding.pry
    names.each do |name|
      island = Island.new 
      island.island_name = name
    end
      
  end
end
