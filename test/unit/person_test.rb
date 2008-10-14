require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
  end
  def test_should_destroy_dependents
    assert_equal(2, @person.bookings.size)
    Person.destroy(@person)
    assert_equal(0, @person.bookings.size)
  end
end
