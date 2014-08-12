require 'spec_helper'

describe EventsController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      assigns[:events].should == Event.all
    end
  end

  describe "#show" do
    before do
       @event = Event.create(summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000) 
    end

    it "sets the event variable" do
      get :show, id: @event.id
      assigns[:event].should == @event
    end
  end

  describe "#edit" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      @event = Event.create(summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000) 
    end

    it "sets the event variable" do
      login_admin(user)
      get :edit, id: @event.id
      assigns[:event].should == @event
    end
  end

  describe "#create" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      login_admin(user)
      post :create, summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000 
    end

    it "creates the event" do
      it { expect(Event.count).to eq(1) }
    end
  end
end