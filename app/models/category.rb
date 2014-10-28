class Category < ActiveRecord::Base
  belongs_to :place

  validates :accesibility_type, inclusion: { in: Accesibilities::TYPES }
  validates :accesibility_type, presence: true
end
