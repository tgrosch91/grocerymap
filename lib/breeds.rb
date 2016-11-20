
require 'pry'
require_relative '../lib/cat'

class Breeds
	include Cattribute
	attr_accessor :name, :cats

	@@all

end
