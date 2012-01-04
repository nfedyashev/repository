module Repository

  # Storage is an abstract base class for the backing storage area of
  # a Repository. Concrete implementations include Stash (for in-memory
  # storage).
  class Storage

    class Unidentified < RuntimeError
    end

    class Unimplemented < RuntimeError
    end
    
    def self.for_class(klass)
      StashStorage.new(klass)
    end

    def initialize(klass = nil)
      @klass = klass
    end

    def size
      raise Unimplemented
    end

    def clear
      raise Unimplemented
    end
    
    # Put an object, or an array of objects, into the storage.
    def store(objects)
      unless objects.is_a? Array
        objects = [objects]
      end
      objects.each do |object|
        store(object)
      end
    end

    # get an object by key
    def get(key)
      find_by_keys([key]).first
    end

    # alias for get
    def [](key)
      get(key)
    end

    # Finds all stashed objects that match the argument. Argument is either
    # a criterion, an key, or an array of either keys or criteria.
    # Returns an array of objects.
    def find(arg)
      if arg.is_a? Criterion
        find_by_criterion(arg)
      elsif arg.is_a? Array
        find_by_keys(arg)
      else
        find_by_keys([arg])
      end
    end
    
    protected
    
    def store(objects)
      raise Unimplemented
    end

    def find_by_criterion(criterion)
      raise Unimplemented
    end
    
    def find_by_keys(keys)
      raise Unimplemented
    end
    
  end
end
