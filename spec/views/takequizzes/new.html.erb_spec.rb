require 'spec_helper'

describe "takequizzes/new" do
  before(:each) do
    assign(:takequiz, stub_model(Takequiz).as_new_record)
  end

  it "renders new takequiz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => takequizzes_path, :method => "post" do
    end
  end
end
