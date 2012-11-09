require "spec_helper"

describe TakequizzesController do
  describe "routing" do

    it "routes to #index" do
      get("/takequizzes").should route_to("takequizzes#index")
    end

    it "routes to #new" do
      get("/takequizzes/new").should route_to("takequizzes#new")
    end

    it "routes to #show" do
      get("/takequizzes/1").should route_to("takequizzes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/takequizzes/1/edit").should route_to("takequizzes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/takequizzes").should route_to("takequizzes#create")
    end

    it "routes to #update" do
      put("/takequizzes/1").should route_to("takequizzes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/takequizzes/1").should route_to("takequizzes#destroy", :id => "1")
    end

  end
end
