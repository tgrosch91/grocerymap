require 'pry'
require_relative '../lib/scraper'

class Cat

	attr_accessor :name, :breed, :gender, :age, :shelter, :bio

	@@all = []



	def initialize(attributes)
		attributes.each{|key,value| self.send(("#{key}="), value)}
		@@all << self
	end

	def self.all
		@@all
	end

  def self.destroy_all
    @@all.clear
  end


end

cat_scraper = Scraper.new

cat_hash = cat_scraper.get_kitten_info("http://theshelterpetproject.org/pet?id=16655758")

new_cat= Cat.new(cat_hash)

print Cat.all
