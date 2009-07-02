require File.join(File.dirname(__FILE__) + '/../spec_helper')

describe Rolex::LineItem do
  describe "#message" do
    it "replaces new lines with semi-colons" do
      line = Rolex::LineItem.new("refactored\nthing 1\nthing 2", 500)
      line.message.should == "refactored; thing 1; thing 2"
    end

    it "gets rid of multiple new lines" do
      line = Rolex::LineItem.new("refactored\n\n\n\nthing 1", 500)
      line.message.should == "refactored; thing 1"
    end

    it "doesn't add semi-colons when there is only one new line" do
      line = Rolex::LineItem.new("refactored\n", 500)
      line.message.should == "refactored"
    end

    it "doesn't add semi-colons when there is no new line" do
      line = Rolex::LineItem.new("refactored", 500)
      line.message.should == "refactored"
    end

    it "removes hyphens at the beginning of a new line" do
      line = Rolex::LineItem.new("refactored\n- thing 1\n- thing 2", 500)
      line.message.should == "refactored; thing 1; thing 2"
    end

    it "removes leading and trailing whitespace" do
      line = Rolex::LineItem.new("  refactored\n  - thing 1\n- thing 2    ", 500)
      line.message.should == "refactored; thing 1; thing 2"
    end
  end
end
