require 'spec_helper'

describe Organization do
  context "should use validate_uniqueness_of_in_memory gem to add unique users" do
    it "should user validate_uniqueness_of_in_memory gem" do
      org = build(:organization)
      org.should_receive(:validate_uniqueness_of_in_memory)
      org.save
    end
  end
end
