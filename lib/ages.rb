
require 'pry'
require_relative '../lib/concerns/cattributes'

class Ages
  include Cattribute::InstanceMethods
  extend Cattribute::ClassMethods
	attr_accessor :name, :cats

  def initialize(name)
    @name = name
    @cats = []
  end

	@@all = []

  def self.all
    @@all
  end


end
