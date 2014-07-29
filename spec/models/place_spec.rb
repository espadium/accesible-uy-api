require 'spec_helper'

describe Place do
  describe 'valid' do
    subject { FactoryGirl.build :place }
    it { should be_valid }
  end

  describe 'invalid' do
    %i(name latitude logitude address author client).each do |field|
      context "missing #{field}" do
        subject { FactoryGirl.build :place, name: nil }
        it { should be_invalid }
      end
    end
  end
end
