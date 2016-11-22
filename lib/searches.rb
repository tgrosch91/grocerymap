require 'pry'
require_relative '../lib/cat.rb'


def see_options(choice)
	option_names = []
	case choice
	when "Shelter"
		Shelters.all.each do |shelter|
		option_names<<shelter.name
		end
	when "Age"
		Ages.all.each do |age|
		option_names<<age.name
		end
	when "Gender"
		Genders.all.each do |gender|
		option_names<<gender.name
		end
	when "Breed"
		Breeds.all.each do |breed|
		option_names<<breed.name
		end
	end
	puts option_names
end

def see_cat_details(name)
	Cat.all.each do |cat|
		if cat.name == name
			puts cat.name
			puts cat.breed.name
			puts cat.gender.name
			puts cat.age.name
			puts cat.shelter.name
		end
	end
end

def get_url_from_zipcode(zipcode)
	url = "http://theshelterpetproject.org/search?location=#{zipcode}&animal=cat&breed=&sex=&size=&age=&offset=0&count=16&page=1"
	return url
end

def send_links_to_scraper(scraper, link_array)
	all_cat_hashes = []
	link_array.each do |link|
		all_cat_hashes << scraper.get_kitten_info(link)
	end
	all_cat_hashes
end

def hash_array_to_object(hash_array)
	hash_array.each do |hash|
		cat = Cat.create_by_hash(hash)
	end
end
