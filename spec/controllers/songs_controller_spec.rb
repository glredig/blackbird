require 'spec_helper'

describe SongsController, type: :controller do
  describe "#index" do
    before(:each) do
      get :index
    end

    it "sets the variables" do
      expect( assigns[:songs]).to eq(Song.all)
    end
  end

  describe "#new" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in user
      get :new
      expect(response).to be_success
    end

    it "makes a new song" do
      expect( assigns(:song)).to be_a_new(Song)
    end
  end

  describe "#create" do
    it "increases the number of songs" do
      user = FactoryGirl.create(:user)
      sign_in user
      expect  {
        post :create, song: { title: "Lorem ipsum", artist: "Blackbird" }
      }.to change(Song, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      @song = Song.create!(title: "Hey Jude", artist: "The Beatles")
    end

    it "deletes the song" do
      expect{ 
        delete :destroy, id: @song.id
      }.to change(Song, :count).by(-1)
    end
  end

  describe "#edit" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in user
      @song = Song.create!(title: "Lorem Ipsum", artist: "Blackbird")
      get :edit, id: @song.id
    end

    it "sets the variables" do
      expect( assigns[:song]).to eq(@song)
    end
  end
end 
