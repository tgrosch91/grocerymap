
require 'pry'
require_relative '../lib/cat'

class Shelters
	include Cattribute
	attr_accessor :name, :cats

	@@all

end
