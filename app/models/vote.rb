class Vote < ActiveRecord::Base
  belongs_to :author
  belongs_to :place
end
