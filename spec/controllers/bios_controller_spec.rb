require 'spec_helper'

describe BiosController do
  describe "#index" do
    before(:each) do
      @bios = Bio.all
      get :index
    end

    it "assigns the variables" do
      expect( assigns[:bios] ).to eq(@bios)
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
      expect( assigns[:bio] ).to be_a_new(Bio)
    end
  end

  describe "#create" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
    end

    it "creates a new bio" do
      expect{ 
        post :create, bio: { name: "John Doe", instruments: "Keys/Cats", summary: "He plays what?" }
      }.to change(Bio, :count).by(1)
    end
  end

  describe "#edit" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      @bio = Bio.create(name: "John Doe", instruments: "Saxamaphone/Vocals", summary: "All around cool cat")
      get :edit, id: @bio.id
      expect( response ).to be_successful
    end

    it "sets the variables" do
      expect( assigns[:bio] ).to eq(@bio)
    end
  end

  describe "#update" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      @bio = Bio.create!(name: "Guy Mannington", instruments: "Slide whistle", summary: "He's neato")
      sign_in user
    end

    it "updates the bio" do
      patch :update, id: @bio.id, bio: { name: "John Dizzy", instruments: "Keys/Cats", summary: "He plays what?" }
      @bio.reload
      expect( @bio.name ).to eq("John Dizzy")
    end  
  end

  describe "#destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      @bio = Bio.create!(name: "Guy Mannington", instruments: "Slide whistle", summary: "He's neato")
    end

    it "deletes the bio" do
      expect{ 
        delete :destroy, id: @bio.id
      }.to change(Bio, :count).by(-1)
    end
  end

  
end