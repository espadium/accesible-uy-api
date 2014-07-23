class Place < ActiveRecord::Base
  belongs_to :author
  belongs_to :client
end
