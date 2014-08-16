require "spec_helper"

describe Review do
  before { @review = Review.create!(name: "Nice Person", date: Date.today, summary: "Blackbird rocks", event: "Wedding") }

  subject { @review }

  it { should respond_to(:name) }
  it { should respond_to(:date) }
  it { should respond_to(:summary) }
  it { should respond_to(:event) }

  it { should be_valid }

  describe "when name is not present" do
    before { @review.name = nil}
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @review.date = nil}
    it { should_not be_valid }
  end

  describe "when summary is not present" do
    before { @review.summary = nil}
    it { should_not be_valid }
  end

  describe "when event is not present" do
    before { @review.event = nil}
    it { should_not be_valid }
  end
end