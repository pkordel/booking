require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup
    @property = properties(:one)
  end
  def test_should_destroy_dependents
    assert_equal(2, @property.rooms.size)
    Property.destroy(@property)
    assert_equal(0, @property.rooms.size)
  end
end
