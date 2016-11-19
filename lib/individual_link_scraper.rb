require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper


	def get_picture_links(url)
		doc = Nokogiri::HTML(open(url))
		pet_urls = []
    	doc.css("#search_container .thumb").each do |pet|
    		pet_url = pet.css("h3 a").attribute("href").value
    		pet_urls << pet_url
    	end
    	pet_urls
	end

	def get_kitten_info(url)
		doc = Nokogiri::HTML(open(url))
		hash = {}
		binding.pry
	end

end

scraper= Scraper.new
scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")


# name = doc.css(".sub-page-header a").text
# breed = doc.css(".pet_details_left .breed").text.split(/:\s/)[1]
# gender = doc.css(".pet_details_left .gender").text.split(/:\s/)[1]
# age = doc.css(".pet_details_right .age").text.split(/:\s/)[1]
# shelter = doc.css(".locale li:nth-child(2)").text.split(/:\s"|"/)[1]
# bio = doc.css(".description p").text
