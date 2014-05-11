require 'spec_helper'

describe Watchlist do

  let(:follower) { FactoryGirl.create(:user) }
  let(:series) { FactoryGirl.create(:series) }
  let(:watchlist) { follower.watchlists.build(series_id: series.id) }

  subject { watchlist }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:series) }
    its(:follower) { should eq follower }
    its(:series) { should eq series }
  end

  describe "when series id is not present" do
    before { watchlist.series_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { watchlist.follower_id = nil }
    it { should_not be_valid }
  end
end
