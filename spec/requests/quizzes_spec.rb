require 'spec_helper'

describe "Quizzes" do

  context 'GET /quizzes/new' do
    it "renders the quiz form" do
      visit new_quiz_path

      page.should have_selector("form#new_quiz[action='/quizzes']")
    end

    it "contains the proper fields" do
      visit new_quiz_path

      page.should have_selector('input#quiz_name')
      page.should have_selector('input#quiz_description')
    end

  end

    # describe "GET /quizzes/1" do
  #   let(:quiz){Quiz.new(:name => "First Quiz")}
  #   it "renders all the questions" do 
  #     visit quiz_path(quiz)

  #     page.should have_content("First Quiz")
  #   end

  #   it "renders all the choices for questions" do
  #   end

  #   it "submits all answers" do
  #   end
  # end

end