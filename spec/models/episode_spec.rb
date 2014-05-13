require 'spec_helper'

describe Episode do
  let(:episode) { FactoryGirl.create(:episode) }


  subject { episode }

  it { should respond_to(:name) }
  it { should respond_to(:season) }
  it { should respond_to(:number) }
  it { should respond_to(:series_id) }

  it { should be_valid }

end