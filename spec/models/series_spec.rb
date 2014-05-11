require 'spec_helper'

describe Series do
  let(:series) { FactoryGirl.create(:series) }
  let(:follower) { FactoryGirl.create(:user) }


  subject { series }

  it { should respond_to(:name) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }

  it { should be_valid }

  describe "user add a series to his watchlist" do
    let(:series) { FactoryGirl.create(:series) }
    before do
      follower.save
      follower.follow!(series)
    end

    describe "series followers" do
      subject { series }
      its(:followers) { should include(follower) }
    end
  end
end
