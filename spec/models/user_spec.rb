require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

  it "is invalid without a properly formatted email" do
    FactoryGirl.build(:user, email: "bad_email").should_not be_valid
  end
end
