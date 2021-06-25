require "test_helper"

class CarriagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carriage = carriages(:one)
  end

  test "should get index" do
    get carriages_url
    assert_response :success
  end

  test "should get new" do
    get new_carriage_url
    assert_response :success
  end

  test "should create carriage" do
    assert_difference('Carriage.count') do
      post carriages_url, params: { carriage: {  } }
    end

    assert_redirected_to carriage_url(Carriage.last)
  end

  test "should show carriage" do
    get carriage_url(@carriage)
    assert_response :success
  end

  test "should get edit" do
    get edit_carriage_url(@carriage)
    assert_response :success
  end

  test "should update carriage" do
    patch carriage_url(@carriage), params: { carriage: {  } }
    assert_redirected_to carriage_url(@carriage)
  end

  test "should destroy carriage" do
    assert_difference('Carriage.count', -1) do
      delete carriage_url(@carriage)
    end

    assert_redirected_to carriages_url
  end
end
