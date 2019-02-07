require 'pry'

class Scraper

  def self.scrape_page
    # html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    # @doc = Nokogiri::HTML(html)
    @@browser = CapybaraScraper::Browser.new.visit("https://www.islands.com/top-20-best-islands-to-live-on/")
    @@browser.page
  end

  def self.scrape_island_attributes
    container = scrape_page.css(".field-sir-trevor-body")
    container.css(".markdown").each do |island|

      if island.css("ul").length > 0
        isl = Island.new
        binding.pry
        isl.name = island.css("h2").text.split(": ")[1]
        isl.paragraphs = island.css("p").map do |p|
          p.text
        end.join

      end
    end



      # if li.text.include?("Population:")
      #   li.css(".list li").each do |fact|
      #     if fact.text.include?("Population")
      #       last_island.population = fact.text.split(": ")[1]
      #     elsif fact.text.include?("Language")
      #       last_island.language_spoken = fact.text.split(": ")[1]
      #     elsif fact.text.include?("Currency")
      #       last_island.currency = fact.text.split(": ")[1]
      #     elsif fact.text.include?("temp")
      #       last_island.temp = fact.text.split(": ")[1]
      #     elsif fact.text.include?("rent")
      #       last_island.average_rent = fact.text.split(": ")[1]
      #     elsif fact.text.include?("home")
      #       last_island.home_price = fact.text.split(": ")[1]
      #     elsif fact.text.include?("milk")
      #       last_island.cost_of_milk = fact.text.split(": ")[1]
      #     end
      #   end
      # end
  end

end
