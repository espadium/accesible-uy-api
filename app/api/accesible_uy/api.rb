require 'grape-swagger'

module AccesibleUy
  class API < Grape::API
    format :json
    version 'v1', using: :path
    add_swagger_documentation

    resource :places do

      desc "Return a place."
      params do
        requires :id, type: Integer, desc: "Place id."
      end
      route_param :id do
        get do
          Place.find(params[:id])
        end
      end

      desc 'Returns a list of places'
      get do
        Place.limit(40)
      end

      desc 'Returns a list of places'
      get '/near/:lat/:long' do
        Place.near(params[:lat], params[:long]).limit(20)
      end
    end
  end
end
