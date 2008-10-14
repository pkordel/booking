class Room < ActiveRecord::Base
  belongs_to :property
  has_many :bookings, :dependent => :destroy
  has_many :people, :through => :bookings
  
  def available
    capacity - bookings.active.count
  end
end
