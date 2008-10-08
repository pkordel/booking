require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  
  def setup
    @property = properties(:one)
  end
  
  def test_should_get_index
    get :index, :property_id => @property
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  def test_should_get_new
    get :new, :property_id => @property
    assert_response :success
  end
  
  def test_should_create_room
    assert_difference('Room.count') do
      post :create, :room => { }, :property_id => @property
    end
  
    assert_redirected_to property_path(@property)
  end
  
  def test_should_show_room
    get :show, :id => rooms(:one).id, :property_id => @property
    assert_response :success
  end
  
  def test_should_get_edit
    get :edit, :id => rooms(:one).id, :property_id => @property
    assert_response :success
  end
  
  def test_should_update_room
    put :update, :id => rooms(:one).id, :room => { }, :property_id => @property
    assert_redirected_to property_path(@property)
  end
  
  def test_should_destroy_room
    assert_difference('Room.count', -1) do
      delete :destroy, :id => rooms(:one).id, :property_id => @property
    end
  
    assert_redirected_to property_path(@property)
  end
end
