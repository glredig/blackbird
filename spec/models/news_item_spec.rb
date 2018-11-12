require 'spec_helper'

describe NewsItem do
  before { @news = NewsItem.create!(title: "test news", content: "test content") }

  subject { @news }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when content is not present" do
    before { @news.content = nil}
    it { should_not be_valid }
  end
end