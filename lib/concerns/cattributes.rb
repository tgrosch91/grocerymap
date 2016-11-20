module Cattribute

  def initialize(name)
    @name = name
    @cats = []
  end

  def save
    @@all<<self
  end

  def self.all
    @@all
  end

  def self.find(name)
    self.all.find{|attribute| attribute.name == attribute}
  end

  def self.create(name)
    self.new(name).tap{|attribute| attribute.save}
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def add_cat(cat_instance)
    @cats << cat_instance
  end

end
