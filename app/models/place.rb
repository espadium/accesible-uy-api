class Place < ActiveRecord::Base
  belongs_to :author
  belongs_to :client

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :name, :latitude, :longitude,
    :author, :client, presence: true

  def self.create_from_params(place)
    Place.create(
      name:      place[:name],
      latitude:  place[:lat],
      longitude: place[:lon],
      # TODO: Add real authentication
      client: Client.first,
      author: Author.first
    )
  end
end
