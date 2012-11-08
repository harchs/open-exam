require 'spec_helper'

describe Question do
  it "should belong to an existing question" do
    choice = Choice.new
    question = Question.find_or_create_by_name("Test Question")

    question.choices.should include(choice)    

  end

end
