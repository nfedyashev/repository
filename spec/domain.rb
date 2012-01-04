require 'ostruct'

module Repository

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
