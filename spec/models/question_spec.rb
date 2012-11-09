require 'spec_helper'

describe Question do
  pending "should belong to an existing question" do
    choice = Choice.new
    question = Question.find_or_create_by_name("Test Question")

    question.choices.should include(choice)    

  end

  it "should only have one correct (true) choice" do
    

  end


end
