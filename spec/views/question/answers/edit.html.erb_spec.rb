require 'spec_helper'

describe "question/answers/edit" do
  before(:each) do
    @question_answer = assign(:question_answer, stub_model(Question::Answer))
  end

  it "renders the edit question_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path(@question_answer), :method => "post" do
    end
  end
end
