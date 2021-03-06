require 'spec_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  before { @comment = user.comments.build(content: "Loremipsum") }

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @comment.content = "a" * 351 }
    it { should_not be_valid }
  end
end