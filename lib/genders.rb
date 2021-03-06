
require 'pry'
require_relative '../lib/concerns/cattributes'

class Genders
  include Cattribute::InstanceMethods
  extend Cattribute::ClassMethods
	attr_accessor :name, :cats

  def initialize(name)
    @name = name
    @cats = []
  end

  def self.create(name)
    self.new(name).tap{|gender| gender.save}
  end

  def self.find(name)
    self.all.find{|gender| gender.name == name}
  end

  def save
     @@all<<self
  end

  def self.all
  	@@all
  end

	@@all = []
end
