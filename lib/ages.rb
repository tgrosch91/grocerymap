
require 'pry'
require_relative '../lib/cat'

class Ages
	include Cattribute
	attr_accessor :name, :cats

	@@all

end
