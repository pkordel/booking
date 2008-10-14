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
end
