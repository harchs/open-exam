require 'spec_helper'

describe "Quizzes" do
<<<<<<< HEAD
=======
  describe "GET /quizzes/1" do
    let(:quiz){Quiz.create(:name => "First Quiz")}

    it "can view a quiz" do 
      visit quiz_path(quiz)
>>>>>>> quiz-tdd

  context 'GET /quizzes/new' do
    it "renders the quiz form" do
      visit new_quiz_path

<<<<<<< HEAD
      page.should have_selector("form#new_quiz[action='/quizzes']")
    end

    it "contains the proper fields" do
      visit new_quiz_path

      page.should have_selector('input#quiz_name')
      page.should have_selector('input#quiz_description')
=======
    pending "renders all questions for a quiz" do
    end
    
    pending "renders all the choices for questions" do
    end

    pending "submits all answers" do
    end
  end

  describe "GET /take/:quiz_id" do
    let(:quiz){Quiz.create(:name => "First Quiz", :is_published => true)}
    let(:quiz2){Quiz.create(:name => "Second Quiz", :is_published => false)}
    let(:question){Question.create(:name => "What color is the sky?", :quiz_id => quiz.id)}
    let(:choice){Choice.create(:name => "Blue", :question_id => question.id)}

    before(:all) do
      quiz.save
      question.save
      choice.save
    end

    it "can only take published quiz" do
      visit take_quiz_path(quiz2)

      page.current_url.should_not match("take")
    end

    it "can submit a completed quiz" do
      visit take_quiz_path(quiz)

      page.choose("Blue")
      click_button("submit")

      page.should have_content("Thank You")
      quiz.answers.count.should > 0
    end

    it "cannot submit an incomplete quiz" do
      visit take_quiz_path(quiz)
      click_button("submit")

      page.should have_content("missing")
>>>>>>> quiz-tdd
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