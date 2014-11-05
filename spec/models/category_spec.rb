require 'spec_helper'

describe Category do
  it { should belong_to :place }

  describe 'place' do
    subject { create(:category, :with_place).place }

    it { should_not be_nil }
    it { should be_a(Place) }
  end

  describe 'valid' do
    subject { FactoryGirl.build :category, :with_place }
    it { should be_valid }
      
    %w(visual motor hearing).each do |accesibility|
      context 'with accesibility type' do
        subject { FactoryGirl.build :category,
          :with_place, accesibility_type: accesibility }
        it { should be_valid }
      end
    end
  end

  describe 'invalid' do
    context 'with any accesbility type' do
      subject { FactoryGirl.build :category, accesibility_type: 'anything' }
      it { should be_invalid }
    end

    context 'without accesbility type' do
      subject { FactoryGirl.build :category, accesibility_type: nil }
      it { should be_invalid }
    end
  end
end
