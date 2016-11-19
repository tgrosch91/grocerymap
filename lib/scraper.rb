require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper


	def get_picture_links(url)
			doc = Nokogiri::HTML(open(url, 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"))
    	binding.pry
	end

end

scraper= Scraper.new
scraper.get_picture_links("https://www.petfinder.com/pet-search?location=63109&animal=cat&breed=&age=baby&distance=25")


#doc.css("#browse #js-petSearch-searchHeader-resultsHeadlineView #search-results")
