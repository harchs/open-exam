require 'spec_helper'

describe "question/answers/new" do
  before(:each) do
    assign(:question_answer, stub_model(Question::Answer).as_new_record)
  end

  it "renders new question_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => question_answers_path, :method => "post" do
    end
  end
end
