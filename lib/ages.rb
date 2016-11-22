
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

  def self.create(name)
    self.new(name).tap{|age| age.save}
  end

  def self.find(name)
    self.all.find{|age| age.name == name}
  end

  def save
     @@all<<self
  end

  def self.all
  	@@all
  end

	@@all = []


end
