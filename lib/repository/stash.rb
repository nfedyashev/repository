# a Stash is a glorified hashtable, used for keeping objects in memory
# and indexing them by key. Any objects put into the stash must have an
# key, as identified by the Keymaster class. A stash is used by Repository
# to keep the objects it recieves from its Storage.
module Repository
  class Stash

    attr_reader :data # for debugging only

    def initialize
      @data = {}
    end

    def size
      @data.size
    end

    def clear
      @data = {}
    end

    # Put an object, or an array of objects, into the stash.
    # All such objects must be identifiable by the Keymaster class;
    # if not, this will raise a Repository::Storage::Unidentified exception
    # (possibly leaving some remaining items unstashed).
    def put(object)
      if object.is_a? Array
        object.each do |o|
          put(o)
        end
      else
        key = object.id
        raise Storage::Unidentified, "you can't stash an object without id" unless key
        @data[key] = object
      end
    end

    # get an object by key
    def get(key)
      @data[key]
    end
    
    alias_method :[], :get

    # Finds all stashed objects that match the argument. Argument is either
    # a criterion, an key, or an array of either keys or criteria.
    # Returns an array of objects.
    def find(arg)
      if arg.is_a? Criterion
        @data.values.select{|object| arg.match? object}
      elsif arg.is_a? Array
        arg.map{|key| get(key)}
      else
        [get(arg)]
      end
    end

  end
end
