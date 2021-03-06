require 'spec_helper'

describe ReviewsController, type: :controller do

  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      expect( assigns[:reviews] ).to eq(Review.all)
    end
  end

  describe "#new" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      get :new
      expect( response ).to be_successful
    end

    it "should assign variables to a new record" do
      expect( assigns[:review] ).to be_a_new(Review)
    end
  end

  describe "#create" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
    end

    it "creates the review" do
      expect {
        post :create, review: { name: "Lorem ipsum", date: Date.today, summary: "Blah blah", event: "Wedding" }
      }.to change(Review, :count).by(1)
    end
  end

  describe "#edit" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      @review = Review.create(name: "Lorem ipsum", date: Date.today, summary: "Blah blah", event: "Wedding") 
    end

    it "sets the review variable" do
      sign_in user
      get :edit, id: @review.id
      expect( assigns[:review] ).to eq(@review)
    end
  end

  describe "#update" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      @review = Review.create!(name: "Lorem ipsum", date: Date.today, summary: "Blah blah", event: "Wedding")
      sign_in user
    end

    it "updates the review" do
      patch :update, id: @review.id, review: { name: "Lorem ipsum", date: Date.today, summary: "Yay!", event: "Wedding" }
      @review.reload
      expect( @review.summary ).to eq("Yay!")
    end  
  end

  describe "#destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      @review = Review.create!(name: "J Doe", summary: "Yay!", date: Date.today, event: "Wedding")
      sign_in user
    end

    it "deletes the review" do
      expect {
        delete :destroy, id: @review.id
      }.to change(Review, :count).by(-1)
    end
  end
end