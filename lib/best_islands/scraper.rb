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

    #container.css("p").first.text to get disclaimer
    container.css(".markdown").each do |island|

      if island.css("ul").length > 0
        isl = Island.new

        isl.name = island.css("h2").text.split(": ")[1]
        isl.paragraphs = island.css("p").map do |p|
          p.text
        end.join
        island.css("li").map do |li|
          if li.text.include?("Population")
            isl.population = li.text.split(": ")[1]
          elsif li.text.include?("Language")
            isl.language_spoken = li.text.split(": ")[1]
          elsif li.text.include?("Currency")
            isl.currency = li.text.split(": ")[1]
          elsif li.text.include?("temp")
            isl.temp = li.text.split(": ")[1]
          elsif li.text.include?("rent")
            isl.average_rent = li.text.split(": ")[1]
          elsif li.text.include?("home")
            isl.home_price = li.text.split(": ")[1]
          elsif li.text.include?("milk")
            isl.cost_of_milk = li.text.split(": ")[1]
          end
        end
      end
    end
  end

  def self.scrape_for_disclaimer
    scrape_page.css(".field-sir-trevor-body p").first.text
  end

end
