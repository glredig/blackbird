require 'spec_helper'

describe Bio do
  before { @bio = Bio.create!(name: "John Doe", instruments: "Vocals/Guitar", summary: "This is the summary text") }

  subject { @bio }

  it { should respond_to(:name) }
  it { should respond_to(:instruments) }
  it { should respond_to(:summary) }

  it { should be_valid }

  describe "when name is not present" do
    before { @bio.name = nil}
    it { should_not be_valid }
  end

  describe "when instruments is not present" do
    before { @bio.instruments = nil}
    it { should_not be_valid }
  end

  describe "when summary is not present" do
    before { @bio.summary = nil}
    it { should_not be_valid }
  end
end