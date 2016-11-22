require 'pry'
require_relative '../lib/cat.rb'

def see_options(choice)
	option_names = []
	case choice
	when "shelters"
		Shelters.all.each do |shelter|
		option_names<<shelter.name
		end
	when "ages"
		Ages.all.each do |age|
		option_names<<age.name
		end
	when "genders"
		Genders.all.each do |gender|
		option_names<<gender.name
		end
	when "breeds"
		Breeds.all.each do |breed|
		option_names<<breed.name
		end
	end
	print option_names
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

scraper = Scraper.new
cat_hash = scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")
cat_hash2 =scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=14316106")
cat= Cat.create_by_hash(cat_hash)
cat2 = Cat.create_by_hash(cat_hash2)
see_options("ages")
Ages.return_matching_cat_names("Kitten")
see_cat_details("Kendrick")
