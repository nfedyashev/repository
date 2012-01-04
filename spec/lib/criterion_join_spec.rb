# encoding: utf-8
require 'helper'

module Repository
  describe Criterion::Join do
    before do
      [::Repository[User], ::Repository[Address]].each do |repository|
        repository.clear
        repository.storage.clear
      end

      ::Repository[Address].size.should == 0
      ::Repository[Address].storage.size.should == 0

      @alice = User.new(id: 1, :name => "Alice")
      @bob = User.new(id: 2, :name => "Bob")
      @charlie = User.new(id: 3, :name => "Charlie")
      ::Repository[User].store [@alice, @bob, @charlie]

      @chez_alice = Address.new(id: 111, :user_id => @alice.id, :street => "12 Apple St.")
      @chez_alice2 = Address.new(id: 222, :user_id => @alice.id, :street => "8 Artichoke Ave.")
      @chez_bob = Address.new(id: 333, :user_id => @bob.id, :street => "28 Banana St.")
      @chez_charlie = Address.new(id: 444, :user_id => @charlie.id, :street => "42 Cherry St.")
      ::Repository[Address].store [@chez_alice, @chez_alice2, @chez_bob, @chez_charlie]

      @nested_criterion = Criterion::Contains.new(:subject => "name", :value => "a")
    end

    describe 'the nested criterion' do
      it "should find only 2 out of the 3 users" do
        ::Repository[User].search(@nested_criterion).should include_only(@alice, @charlie)
      end
    end

    it "can be used as the target of an Equals criterion" do
      straight_id_criterion = Criterion::Equals.new(:subject => :user_id, :value => [@alice.id, @charlie.id])
      addresses = ::Repository[Address].search(straight_id_criterion)
      addresses.should == [@chez_alice, @chez_alice2, @chez_charlie]
    end
  end

end
