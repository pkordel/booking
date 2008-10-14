require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  def setup
    @property = properties(:one)
    @room = rooms(:one)
  end
  def test_should_get_index
    get :index, :property_id => @property, :room_id => @room
    assert_response :success
    assert_not_nil assigns(:bookings)
  end

  # def test_should_get_new
  #   get :new, :room_id => @room
  #   assert_response :success
  # end
  # 
  # def test_should_create_booking
  #   assert_difference('Booking.count') do
  #     post :create, :booking => { }, :room_id => @room
  #   end
  # 
  #   assert_redirected_to property_path(@room.property)
  # end
  # 
  # def test_should_show_booking
  #   get :show, :id => bookings(:one).id, :room_id => @room.id
  #   assert_response :success
  # end
  # 
  # def test_should_get_edit
  #   get :edit, :id => bookings(:one).id, :room_id => @room
  #   assert_response :success
  # end
  # 
  # def test_should_update_booking
  #   put :update, :id => bookings(:one).id, :booking => { }, :room_id => @room
  #   assert_redirected_to booking_path(assigns(:booking))
  # end
  # 
  # def test_should_destroy_booking
  #   assert_difference('Booking.count', -1) do
  #     delete :destroy, :id => bookings(:one).id, :room_id => @room
  #   end
  # 
  #   assert_redirected_to bookings_path
  # end
end
