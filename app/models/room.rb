class Room < ActiveRecord::Base
  belongs_to :property
  has_many :bookings
  has_many :people, :through => :bookings
end
