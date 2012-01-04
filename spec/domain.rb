require 'ostruct'

module Repository

  #class Treasure
  #  attr_accessor :id, :entered_repository

  #  def treasury_key
  #    id
  #  end

  #  def initialize(hash = {})
  #    {:id => nil}.merge(hash).each_pair do |k,v|
  #      self.class.class_eval do
  #        attr_accessor k.to_sym
  #      end
  #      instance_variable_set("@#{k}", v)
  #    end
  #  end

  #  def save!
  #    unless id
  #      @@next_id ||= 0
  #      @id = (@@next_id += 1)
  #    end
  #  end
  #end

  ###

  class Project < OpenStruct
  end
  
  class User < OpenStruct
    def initialize(hash = {})
      super({:name => nil}.merge(hash))
    end
  end

  class Address < OpenStruct
  end

  class Country < OpenStruct
  end


end
