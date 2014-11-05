require 'spec_helper'

describe Place do
  it { should have_many :categories }

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

  describe 'reverse geocode' do
    subject { FactoryGirl.create(:place, address: nil) }

    it 'should geocode the address' do
      pending 'Geocode fail sometimes. We need to investigate'
      subject.address.should_not be_nil
    end
  end
end
