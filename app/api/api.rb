class API < Grape::API
  prefix 'api'
  format :json

  mount AccesibleUYAPI
end
