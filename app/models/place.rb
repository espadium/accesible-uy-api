class Place < ActiveRecord::Base
  belongs_to :author
  belongs_to :client

  validates :name, :address, :latitude, :longitude,
    :author, :client, presence: true
end
