require 'spec_helper'

describe AccesibleUy::API do
  describe 'GET /api/v1/places' do
    before { get '/api/v1/places' }

    it 'returns an empty array of places' do
      JSON.parse(response.body).should == []
    end

    it 'returns success' do
      response.status.should == 200
    end

    context 'with places data' do
      before do
        FactoryGirl.create_list(:place, 10)
        get '/api/v1/places'
      end

      it 'returns array of 10 places' do
        JSON.parse(response.body).size.should be(10)
      end

      it 'returns success' do
        response.status.should == 200
      end
    end
  end
end
