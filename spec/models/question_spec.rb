require 'spec_helper'

describe Question do
  let(:question) {create(:question)}

  context "on initalization" do
    it "selected should be false" do
      question.selected.should be_false
    end
  end

  context "#is_selected?" do
    it "should return the selected boolean" do
      question.is_selected?.should == question.selected
    end
  end

  context "on initalization" do
    it "should use the validate_uniqueness_of_in_memory gem" do
      quest = build(:question)
      quest.should_receive(:validate_uniqueness_of_in_memory)
      quest.save
    end
  end

  context "#absolute_position" do
    it "should return its position in a quiz" do
      quiz = create(:quiz_with_approved)
      quest = quiz.approved_questions.first
      quest.absolute_position.should == 1
    end
  end

end
