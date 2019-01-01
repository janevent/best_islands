require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "best_islands/version"
require_relative 'best_islands/cli'
require_relative 'best_islands/scraper'
require_relative 'best_islands/site'

module BestIslands
  class Error < StandardError; end
  # Your code goes here...
end
