class Room < ActiveRecord::Base
  belongs_to :property
  has_many :bookings, :dependent => :destroy
  has_many :people, :through => :bookings
  
  def available
    capacity - bookings.active.count
  end
  
  def active_bookings(start_date=nil, end_date=nil)
    bookings.active(start_date, end_date)
  end
end
