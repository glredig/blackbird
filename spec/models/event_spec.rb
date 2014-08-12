require "spec_helper"

describe Event do
  before { @event = Event.create!(summary: "Lorem ipsum", accessible: 1, location: "123 Awesome Way", date: Date.today, pay: 10000) }

  subject { @event }

  it { should respond_to(:summary) }
  it { should respond_to(:accessible) }
  it { should respond_to(:location) }
  it { should respond_to(:date) }
  it { should respond_to(:pay) }

  it { should be_valid }

  describe "when summary is not present" do
    before { @event.summary = nil}
    it { should_not be_valid }
  end

  describe "when accessible is not present" do
    before { @event.accessible = nil}
    it { should_not be_valid }
  end

  describe "when location is not present" do
    before { @event.location = nil}
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @event.date = nil}
    it { should_not be_valid }
  end

  describe "when pay is not present" do
    before { @event.pay = nil}
    it { should_not be_valid }
  end
end