require 'spec_helper'

describe Choice do
  it "should know if it is correct" do
    choice = Choice.new(:is_correct => 1)
    choice.is_correct.should == true
    
  end  

end



# When you create a question, there are associated choices. You do not create choices that don't belong to a question