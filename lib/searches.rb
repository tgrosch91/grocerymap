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

def response_choices(cat_name_array,choices_array)
	response = gets.chomp
	if cat_name_array.include?(response)
		see_cat_details(response)
	elsif choices_array.include?(response)
		see_options(response)
	else puts "That is not a valid response. Please enter a name or an attribute to search by:"
		response_choices(cat_name_array, choices_array)
	end
	return response
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

def results_from_attribute(attribute_choice_response, choice)
	cat_option_names = []
	case choice
	when "Shelter"
		Shelters.all.each do |shelter|
			if shelter.name == attribute_choice_response
				shelter.cats.each do |cat|
					cat_option_names<<cat.name
				end
			end
		end
	when "Gender"
		Genders.all.each do |gender|
			if gender.name == attribute_choice_response
				gender.cats.each do |cat|
					cat_option_names<<cat.name
				end
			end
		end
	when "Age"
		Ages.all.each do |age|
			if age.name == attribute_choice_response
				age.cats.each do |cat|
					cat_option_names<<cat.name
				end
			end
		end
	when "Breed"
		Shelters.all.each do |breed|
			if breed.name == attribute_choice_response
				breed.cats.each do |cat|
					cat_option_names<<cat.name
				end
			end
		end
	end
	puts cat_option_names
end
