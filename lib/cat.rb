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
