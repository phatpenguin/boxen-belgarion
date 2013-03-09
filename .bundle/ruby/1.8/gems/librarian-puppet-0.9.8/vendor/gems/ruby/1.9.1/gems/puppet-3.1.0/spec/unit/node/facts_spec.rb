#! /usr/bin/env ruby
require 'spec_helper'
require 'matchers/json'
require 'puppet/node/facts'

describe Puppet::Node::Facts, "when indirecting" do
  before do
    @facts = Puppet::Node::Facts.new("me")
  end

  it "should be able to convert all fact values to strings" do
    @facts.values["one"] = 1
    @facts.stringify
    @facts.values["one"].should == "1"
  end

  it "should add the node's certificate name as the 'clientcert' fact when adding local facts" do
    @facts.add_local_facts
    @facts.values["clientcert"].should == Puppet.settings[:certname]
  end

  it "should add the Puppet version as a 'clientversion' fact when adding local facts" do
    @facts.add_local_facts
    @facts.values["clientversion"].should == Puppet.version.to_s
  end

  it "should not add the current environment" do
    @facts.add_local_facts
    @facts.values.should_not include("environment")
  end

  it "should not replace any existing environment fact when adding local facts" do
    @facts.values["environment"] = "foo"
    @facts.add_local_facts
    @facts.values["environment"].should == "foo"
  end

  describe "when indirecting" do
    before do
      @indirection = stub 'indirection', :request => mock('request'), :name => :facts

      @facts = Puppet::Node::Facts.new("me", "one" => "two")
    end

    it "should redirect to the specified fact store for storage" do
      Puppet::Node::Facts.stubs(:indirection).returns(@indirection)
      @indirection.expects(:save)
      Puppet::Node::Facts.indirection.save(@facts)
    end

    describe "when the Puppet application is 'master'" do
      it "should default to the 'yaml' terminus" do
        pending "Cannot test the behavior of defaults in defaults.rb"
        # Puppet::Node::Facts.indirection.terminus_class.should == :yaml
      end
    end

    describe "when the Puppet application is not 'master'" do
      it "should default to the 'facter' terminus" do
        pending "Cannot test the behavior of defaults in defaults.rb"
        # Puppet::Node::Facts.indirection.terminus_class.should == :facter
      end
    end

  end

  describe "when storing and retrieving" do
    it "should add metadata to the facts" do
      facts = Puppet::Node::Facts.new("me", "one" => "two", "three" => "four")
      facts.values[:_timestamp].should be_instance_of(Time)
    end

    describe "using pson" do
      before :each do
        @timestamp = Time.parse("Thu Oct 28 11:16:31 -0700 2010")
        @expiration = Time.parse("Thu Oct 28 11:21:31 -0700 2010")
      end

      it "should accept properly formatted pson" do
        pson = %Q({"name": "foo", "expiration": "#{@expiration}", "timestamp": "#{@timestamp}", "values": {"a": "1", "b": "2", "c": "3"}})
        format = Puppet::Network::FormatHandler.format('pson')
        facts = format.intern(Puppet::Node::Facts,pson)
        facts.name.should == 'foo'
        facts.expiration.should == @expiration
        facts.values.should == {'a' => '1', 'b' => '2', 'c' => '3', :_timestamp => @timestamp}
      end

      it "should generate properly formatted pson" do
        Time.stubs(:now).returns(@timestamp)
        facts = Puppet::Node::Facts.new("foo", {'a' => 1, 'b' => 2, 'c' => 3})
        facts.expiration = @expiration
        result = PSON.parse(facts.to_pson)
        result['name'].should == facts.name
        result['values'].should == facts.values.reject { |key, value| key.to_s =~ /_/ }
        result['timestamp'].should == facts.timestamp.to_s
        result['expiration'].should == facts.expiration.to_s
      end

      it "should not include nil values" do
        facts = Puppet::Node::Facts.new("foo", {'a' => 1, 'b' => 2, 'c' => 3})
        pson = PSON.parse(facts.to_pson)
        pson.should_not be_include("expiration")
      end

      it "should be able to handle nil values" do
        pson = %Q({"name": "foo", "values": {"a": "1", "b": "2", "c": "3"}})
        format = Puppet::Network::FormatHandler.format('pson')
        facts = format.intern(Puppet::Node::Facts,pson)
        facts.name.should == 'foo'
        facts.expiration.should be_nil
      end
    end
  end
end
