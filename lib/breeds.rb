
require 'pry'
require_relative '../lib/concerns/cattributes'

class Breeds
	include Cattribute::InstanceMethods
  extend Cattribute::ClassMethods
	attr_accessor :name, :cats

  def initialize(name)
    @name = name
    @cats = []
  end

	def self.create(name)
		self.new(name).tap{|breed| breed.save}
	end

	def save
		 @@all<<self
  end

	def self.all
  	@@all
  end

	@@all = []

end
