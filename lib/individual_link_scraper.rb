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

	def get_kitten_info(url)
		doc = Nokogiri::HTML(open(url))
		hash = {}
		hash[:name]=doc.css(".sub-page-header a").text
		hash[:breed]=doc.css(".pet_details_left .breed").text.split(/:\s/)[1]
		hash[:gender]=doc.css(".pet_details_left .gender").text.split(/:\s/)[1]
		hash[:age]=doc.css(".pet_details_right .age").text.split(/:\s/)[1]
		hash[:shelter]=doc.css(".locale li:nth-child(2)").text.split(/:\s"|"/)[1]
		hash[:bio]=doc.css(".description p").text
		hash
	end

end
