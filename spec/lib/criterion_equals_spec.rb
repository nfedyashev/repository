# encoding: utf-8
require 'helper'

module Repository
  describe Criterion do
    before do
      @alice = User.new(:name => "Alice", :id => 1)
      @bob = User.new(:name => "Bob", :id => 2)
      @charlie = User.new(:name => "Charlie", :id => 3)
    end

    describe Criterion::Equals do
      before do
        @c = Criterion::Equals.new(:subject => "name", :value => "alex")
      end

      it "has a swell descriptor" do
        Criterion::Equals.new({}).descriptor.should == "id equals"
      end

      describe '#match' do
        describe "a string" do
          before do
            @c = Criterion::Equals.new(:subject => "name", :value => "Alice")
          end

          it "matches a string" do
            @c.should be_match @alice
          end

          it "fails to match a string" do
            @c.should_not be_match @bob
          end

          it "fails to match a string with the wrong case" do
            @c.should_not be_match User.new(:name => "alice")
          end
        end

        describe "an int" do
          before do
            @c = Criterion::Equals.new(:subject => "id", :value => 1)
          end

          it "matches an int" do
            @c.match?(@alice).should be_true
          end

          it "fails to match an int" do
            @c.match?(@bob).should be_false
          end
        end

        describe "a set of ints" do
          before do
            @c = Criterion::Equals.new(:subject => "id", :value => [1,2])
          end

          it "matches" do
            @c.should be_match @alice
            @c.should be_match @bob
          end

          it "fails to match an int" do
            @c.should_not be_match @charlie
          end
        end

        describe "a string value in the criterion" do
          it "should match an int value in the object" do
            @c = Criterion::Equals.new(:subject => "id", :value => "1")
            @c.should be_match @alice
          end
        end

      end
    end
  end
end
