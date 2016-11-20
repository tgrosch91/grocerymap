module Cattribute

  module ClassMethods

    @@all =[]

    def all
      @@all
    end

    def find(name)
      self.all.find{|attribute| attribute.name == attribute}
    end

    def create(name)
      self.new(name).tap{|attribute| attribute.save}
    end

    def find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.create(name)
    end

  end

  module InstanceMethods

    def reset_all
      self.all.clear
    end

    def count
      self.all.count
    end

    def save
      self.all<<self
    end

    def add_cat(cat_instance)
      @cats << cat_instance
    end

  end

end
