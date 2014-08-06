class Place < ActiveRecord::Base
  belongs_to :author
  belongs_to :client

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :name, :latitude, :longitude,
    :author, :client, presence: true
end
