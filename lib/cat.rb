require 'pry'
require_relative '../lib/scraper'
require_relative '../lib/breeds'
require_relative '../lib/genders'
require_relative '../lib/shelters'
require_relative '../lib/ages'

class Cat

	attr_accessor :name, :breed, :gender, :age, :shelter, :bio

	@@all = []

	def initialize(name)
		@name = name
	end

	def self.all
		@@all
	end

	def self.destroy_all
	    @@all.clear
	end

	def create_by_hash(attributes)
		attributes.each do |key,value|
			case key
			when :name
				cat= Cat.new(value)
			when :gender
				cat.cat_gender=(value)
			when :breed
				cat.cat_breed=(value)
			when :age
				cat.cat_age=(value)
			when :shelter
				cat.cat_shelter=(value)
			when :bio
				self.send(("#{key}="), value)
			end
		end
		@@all << self
	end

	def cat_gender=(name)
		self.gender = Genders.find_or_create_by_name(name)
		gender.add_cat(self)
	end

	def cat_breed=(name)
		self.breed = Breeds.find_or_create_by_name(name)
		breed.add_cat(self)
	end

	def cat_age=(name)
		self.age = Ages.find_or_create_by_name(name)
		age.add_cat(self)
	end

	def cat_shelter=(name)
		self.shelter = Shelters.find_or_create_by_name(name)
		age.add_cat(self)
	end


end

scraper = Scraper.new
cat_hash = scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")

cat= Cat.new(cat_hash)

print Cat.all
print Breeds.all
