class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :person
  
  # This allows us to say Booking.active and @booking.active and 
  # receive an array of all bookings that start and end on a given date.
  named_scope :active, lambda { |*args| {:conditions => ["(? BETWEEN start_date AND end_date) OR 
                                                          (? BETWEEN start_date AND end_date) OR 
                                                          (start_date BETWEEN ? AND ?)", 
                                                          (args.first || Time.now), 
                                                          (args.last || Time.now),
                                                          (args.first || Time.now), 
                                                          (args.last || Time.now)]} }
protected
  def validate_on_create
    errors.add("start_date", "must be in the future") unless start_date >= Time.now
    errors.add("end_date", "must be in the future") unless end_date >= Time.now
    errors.add("end_date", "must follow start_date") unless end_date >= start_date
    errors.add("time slot", "is unavailable") unless room.bookings.active(start_date, end_date).count == 0
  end
  # TODO: validate_on_update
end
