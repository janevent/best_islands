class Scraper
  def scrape_page
    html = open("https://www.islands.com/top-20-best-islands-to-live-on/")
    doc = Nokogiri::HTML(html)

  end
end
