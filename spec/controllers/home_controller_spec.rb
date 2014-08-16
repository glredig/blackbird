require 'spec_helper'

describe HomeController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      expect( assigns[:events] ).to eq(Event.all)
    end
  end
end
