
require 'pry'
require_relative '../lib/cat'
require_relative '../lib/concerns/cattributes'

class Ages
	include Cattribute
	attr_accessor :name, :cats

	@@all =[]

end
