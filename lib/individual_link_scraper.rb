require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper


	def get_individual_links(url)
		doc = Nokogiri::HTML(open(url))
		pet_urls = []
    	doc.css("#search_container .thumb").each do |pet|
    		pet_url = pet.css("h3 a").attribute("href").value
    		pet_urls << pet_url
    	end
    	pet_urls
	end

end

scraper= Scraper.new
scraper.get_picture_links("http://theshelterpetproject.org/search?location=63109&animal=cat&breed=&sex=&size=&age=&offset=0&count=16&page=1")
