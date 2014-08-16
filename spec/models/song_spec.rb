require "spec_helper"

describe Song do
  before { @song = Song.create!(title: "Lorem ipsum", artist: "Blackbird") }

  subject { @song }

  it { should respond_to(:title) }
  it { should respond_to(:artist) }

  it { should be_valid }

  describe "when title is not present" do
    before { @song.title = nil}
    it { should_not be_valid }
  end

  describe "when artist is not present" do
    before { @song.artist = nil}
    it { should_not be_valid }
  end
end