require 'spec_helper'

describe "takequizzes/index" do
  before(:each) do
    assign(:takequizzes, [
      stub_model(Takequiz),
      stub_model(Takequiz)
    ])
  end

  it "renders a list of takequizzes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
