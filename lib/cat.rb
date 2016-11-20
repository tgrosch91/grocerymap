require 'pry'
require_relative '../lib/scraper'

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
		attributes.each{|key,value| self.send(("#{key}="), value)}
		@@all << self)
	end

	def cat_gender=(name)
		self.gender = Gender.find_or_create_by_name(name)
		gender.add_cat(self)
	end



end

scraper = Scraper.new
cat_hash = scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")

cat= Cat.new(cat_hash)

print Cat.all
