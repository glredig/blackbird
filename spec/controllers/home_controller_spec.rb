require 'spec_helper'

describe HomeController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      assigns[:events].should == Event.all
    end
  end
end
