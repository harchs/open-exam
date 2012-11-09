require 'spec_helper'

describe "question/answers/show" do
  before(:each) do
    @question_answer = assign(:question_answer, stub_model(Question::Answer))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
