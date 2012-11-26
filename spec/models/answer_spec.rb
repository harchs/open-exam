require 'spec_helper'

describe Answer do
  it "is unique to a question per user" do
    expect {
      Answer.create!(:question_id => 1, :user_id => 2)
      Answer.create!(:question_id => 1, :user_id => 2)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end 
end
