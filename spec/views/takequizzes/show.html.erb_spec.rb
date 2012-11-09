require 'spec_helper'

describe "takequizzes/show" do
  before(:each) do
    @takequiz = assign(:takequiz, stub_model(Takequiz))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
