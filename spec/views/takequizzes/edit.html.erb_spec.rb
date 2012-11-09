require 'spec_helper'

describe "takequizzes/edit" do
  before(:each) do
    @takequiz = assign(:takequiz, stub_model(Takequiz))
  end

  it "renders the edit takequiz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => takequizzes_path(@takequiz), :method => "post" do
    end
  end
end
