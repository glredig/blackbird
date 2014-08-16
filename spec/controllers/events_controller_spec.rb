require 'spec_helper'

describe EventsController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      expect( assigns[:events] ).to eq(Event.all)
    end
  end

  describe "#show" do
    before do
       @event = Event.create(summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000) 
    end

    it "sets the event variable" do
      get :show, id: @event.id
      expect( assigns[:event] ).to eq(@event)
    end
  end

  describe "#edit" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      @event = Event.create(summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000) 
    end

    it "sets the event variable" do
      sign_in user
      get :edit, id: @event.id
      expect( assigns[:event] ).to eq(@event)
    end
  end

  describe "#create" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
    end

    it "creates the event" do
      expect {
        post :create, event: { summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000 }
      }.to change(Event, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      @event = Event.create!(summary: "Lorem ipsum", location: "123 Awesome way", accessible: 1, date: Date.today, pay: 300000)
      sign_in user
    end

    it "deletes the event" do
      expect {
        delete :destroy, id: @event.id
      }.to change(Event, :count).by(-1)
    end
  end
end