require 'spec_helper'

describe AccesibleUy::API do
  describe 'POST /api/v1/places/' do
    context 'with all the parameters' do
      before do
        @params = {
          lat: '-10.1',
          lon: '-40.5',
          name: 'Testing place',
        }

        # TODO: Remove after implementation of authentication
        FactoryGirl.create(:author)
        FactoryGirl.create(:client)
      end

      it 'should add a Place' do
        expect { post '/api/v1/places', @params }.to change{ Place.count }.by(1)
      end
    end

    context 'with missing parameter' do
      before do
        @params = {
          lon: '-40.5',
          name: 'Testing place',
        }

        # TODO: Remove after implementation of authentication
        FactoryGirl.create(:author)
        FactoryGirl.create(:client)
      end

      it 'should not add a Place' do
        expect { post '/api/v1/places', @params }.not_to change{ Place.count }
      end

      it 'should not add a Place' do
        response = post '/api/v1/places', @params
        response.should eq(400)
      end
    end
  end

  describe 'GET /api/v1/places/:id' do
    before { get '/api/v1/places' }

    it 'returns an empty hash' do
      JSON.parse(response.body).should == []
    end

    context 'with places data' do
      before do
        @place = FactoryGirl.create(:place, :with_categories)
        get "/api/v1/places/#{@place.id}"
      end

      it 'returns the place' do
        JSON.parse(response.body)["id"].should be(@place.id)
      end
    end
  end

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
