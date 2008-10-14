require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = rooms(:one)
  end
  def test_should_destroy_dependents
    assert_equal(2, @room.bookings.size)
    Room.destroy(@room)
    assert_equal(0, @room.bookings.size)
  end
  def test_should_show_available
    assert_equal(2, @room.available)
    @room.bookings.first.update_attributes(:end_date => 1.day.from_now)
    assert_equal(1, @room.available)
  end
end
