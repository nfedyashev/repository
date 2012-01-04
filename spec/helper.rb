ENV["T_ENV"] = "test"
require 'repository'
require 'rspec'
require 'pry'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'domain'

module CustomMatchers
  # borrowed from http://github.com/aiwilliams/spec_goodies

  class IncludeOnly # :nodoc:all
    def initialize(*expected)
      @expected = expected.flatten
    end

    def matches?(actual)
      @missing = @expected.reject {|e| actual.include?(e)}
      @extra = actual.reject {|e| @expected.include?(e)}
      @extra.empty? && @missing.empty?
    end

    def failure_message
      message = "expected to include only #{@expected.inspect}"
      message << "\nextra: #{@extra.inspect}" unless @extra.empty?
      message << "\nmissing: #{@missing.inspect}" unless @missing.empty?
      message
    end

    def negative_failure_message
      "expected to include more than #{@expected.inspect}"
    end

    def to_s
      "include only #{@expected.inspect}"
    end
  end

  # Unlike checking that two Enumerables are equal, where the
  # objects in corresponding positions must be equal, this will
  # allow you to ensure that an Enumerable has all the objects
  # you expect, in any order; no more, no less.
  def include_only(*expected)
    IncludeOnly.new(*expected)
  end
end

RSpec.configure do |config|
  include CustomMatchers
end
