require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

  it "is invalid without a properly formatted email" do
    expect(FactoryGirl.build(:user, email: "bad_email")).to_not be_valid
  end

  it "should be a superuser" do
    FactoryGirl.build(:user, role: "superuser").is_superuser?.should be_true
  end

  it "should not be a superuser" do
    expect(FactoryGirl.build(:user, role: "blah").is_superuser?).to_not be_true
  end

  it "should be a student by default" do
    FactoryGirl.create(:user).role.should == "student"
  end

end
