require 'grape-swagger'

module AccesibleUy
  class API < Grape::API
    format :json
    version 'v1', using: :path
    add_swagger_documentation

    helpers do
      def current_user
        # TODO: Add real authentication
        true
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

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

      desc "Creates a place."
      params do
        requires :lat, type: String, desc: "The latitude string."
        requires :lon, type: String, desc: "The longitude string."
        requires :name, type: String, desc: "The name of the place."
      end
      post do
        authenticate!
        Place.create_from_params(params).errors
      end
    end
  end
end
