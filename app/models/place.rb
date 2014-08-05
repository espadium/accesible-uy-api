class Place < ActiveRecord::Base
  NEAR_DISTANCE = 1

  belongs_to :author
  belongs_to :client

  validates :name, :address, :latitude, :longitude,
    :author, :client, presence: true

  scope :near, ->(lat, long) {
    where latitude: (lat - NEAR_DISTANCE)..(lat + NEAR_DISTANCE),
      longitude: (long - NEAR_DISTANCE)..(long + NEAR_DISTANCE)
  }
end
