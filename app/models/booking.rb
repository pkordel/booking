class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :person
  
  # This allows us to say Booking.active and @booking.active and 
  # receive an array of all bookings that start and end on a given date.
  named_scope :active, lambda { |*args| {:conditions => ["start_date < ? AND end_date > ?", 
                                                          (args.first || Time.now), 
                                                          (args.last || Time.now)]} }
end
