require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

	def get_page(url)
		doc = Nokogiri::HTML(open(url))
		doc
	end

	def get_picture_links(url)
		doc = self.get_page(url)
    	binding.pry
	end

end

scraper= Scraper.new
scraper.get_picture_links("https://www.petfinder.com/pet-search?location=63109&animal=cat&breed=&age=baby&distance=25")


#doc.css("#browse #js-petSearch-searchHeader-resultsHeadlineView #search-results")
