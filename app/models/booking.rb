class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :person
  
  # This allows us to say Booking.active and @booking.active and 
  # receive an array of all bookings that end in the future.
  named_scope :active, lambda { |*args| {:conditions => ["end_date > ?", (args.first || Time.now)]} }
end
