require "spec_helper"

describe CoversController do
  describe "routing" do

    it "routes to #index" do
      get("/covers").should route_to("covers#index")
    end

    it "routes to #new" do
      get("/covers/new").should route_to("covers#new")
    end

    it "routes to #show" do
      get("/covers/1").should route_to("covers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/covers/1/edit").should route_to("covers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/covers").should route_to("covers#create")
    end

    it "routes to #update" do
      put("/covers/1").should route_to("covers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/covers/1").should route_to("covers#destroy", :id => "1")
    end

  end
end
