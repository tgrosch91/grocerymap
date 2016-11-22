module Cattribute

  module ClassMethods

    def find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.create(name)
    end

    def return_matching_cat_names(type)
    	cat_name_array = []
    	self.all.each do |attribute|
    		if attribute.name == type
    			attribute.cats.each do |cat|
    				each_name = cat.name
    				cat_name_array<<each_name
          end
    			end
    		end
    	puts cat_name_array
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
