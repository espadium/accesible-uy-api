module Entities
  class PlaceEntity < Grape::Entity
    expose :id, :name, :address, :latitude, :longitude
    expose :categories
  end
end
