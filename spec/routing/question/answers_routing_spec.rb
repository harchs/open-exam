require "spec_helper"

describe Question::AnswersController do
  describe "routing" do

    it "routes to #index" do
      get("/question/answers").should route_to("question/answers#index")
    end

    it "routes to #new" do
      get("/question/answers/new").should route_to("question/answers#new")
    end

    it "routes to #show" do
      get("/question/answers/1").should route_to("question/answers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question/answers/1/edit").should route_to("question/answers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question/answers").should route_to("question/answers#create")
    end

    it "routes to #update" do
      put("/question/answers/1").should route_to("question/answers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question/answers/1").should route_to("question/answers#destroy", :id => "1")
    end

  end
end
