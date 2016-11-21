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

	def self.create_by_hash(attributes)
		cat_name = attributes[:name]
		cat = Cat.new(cat_name)
		attributes.each do |key,value|
			case key
			when :breed
				cat.cat_breed=(value)
			when :gender
				cat.cat_gender=(value)
			when :age
				cat.cat_age=(value)
			when :shelter
				cat.cat_shelter=(value)
			end
		end
		@@all << cat
		cat
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
		shelter.add_cat(self)
	end


end

scraper = Scraper.new
cat_hash = scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")
cat_hash2 =scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=14316106")
cat= Cat.create_by_hash(cat_hash)
cat2 = Cat.create_by_hash(cat_hash2)
print Shelters.all
