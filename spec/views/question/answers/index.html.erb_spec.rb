require 'spec_helper'

describe "question/answers/index" do
  before(:each) do
    assign(:question_answers, [
      stub_model(Question::Answer),
      stub_model(Question::Answer)
    ])
  end

  it "renders a list of question/answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
