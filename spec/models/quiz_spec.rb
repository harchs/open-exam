require 'spec_helper'

describe Quiz do
  let(:quiz){Quiz.create(:name => "First Quiz", :description => "Test", :passing_grade => 20)}

  it "should not be published by default" do
    quiz.is_published.should == false
  end

  it "can add questions to a quiz" do
    quiz.questions << Question.create!(:name => "First Question", :choices => [Choice.create!(:name => "b"), Choice.create!(:name => "a", :is_correct => true)])

    quiz.questions.length.should == 1
  end

  it "can publish a quiz" do
    quiz.is_published = true
    quiz.is_published.should == true
  end

end
