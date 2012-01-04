# encoding: utf-8
require 'helper'

module Repository
  describe Criterion do
    before do
      @alice = User.new(:name => "Alice", :id => 1)
      @bob = User.new(:name => "Bob", :id => 2)
      @charlie = User.new(:name => "Charlie", :id => 3)
    end

    describe Criterion::And do
      before do
        @c = Criterion::And.new(
          (@c1 = Criterion::Contains.new(:subject => "name", :value => "a")),
          (@c2 = Criterion::Contains.new(:subject => "name", :value => "r"))
        )
      end

      describe '#match' do

        it "fails to match if no criteria match" do
          @c.should_not be_match(@bob)
        end

        it "fails to match if only one criterion matches" do
          @c.should_not be_match(@alice)
        end

        it "matches if all criteria match" do
          @c.should be_match(@charlie)
        end
      end
    end

    describe Criterion::Or do
      before do
        @c = Criterion::Or.new(
          (@c1 = Criterion::Contains.new(:subject => "name", :value => "o")),  # 'o' is only in 'bob'
          (@c2 = Criterion::Contains.new(:subject => "name", :value => "r"))   # 'r' is only in 'charlie'
        )
      end

      describe '#match' do
        it "fails to match if no criteria match" do
          @c.should_not be_match(@alice)
        end

        it "matches if only one criterion matches" do
          @c.should be_match(@bob)
          @c.should be_match(@charlie)
        end
      end
    end


  end
end
