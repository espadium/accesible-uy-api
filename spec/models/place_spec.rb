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

  describe 'near' do
    subject { Place.near(0,0) }

    it { should be_empty }

    context 'with places near by' do
      before { FactoryGirl.create_list(:near_place, 5, latitude: 1, longitude: 1) }
      it { should_not be_empty }
    end
  end
end
