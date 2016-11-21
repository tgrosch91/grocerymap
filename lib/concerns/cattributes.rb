module Cattribute

  module ClassMethods

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

    def add_cat(cat_instance)
      @cats << cat_instance
    end

  end

end
