require 'spec_helper'

describe Choice do
  context "on initialization" do
    it "is_correct should be set to false" do
      create(:choice).is_correct.should be_false
    end
  end
end



# When you create a question, there are associated choices. You do not create choices that don't belong to a question