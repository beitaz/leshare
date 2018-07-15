require 'test_helper'

class ShopStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_status = shop_statuses(:one)
  end

  test "should get index" do
    get shop_statuses_url, as: :json
    assert_response :success
  end

  test "should create shop_status" do
    assert_difference('ShopStatus.count') do
      post shop_statuses_url, params: { shop_status: { begin_time: @shop_status.begin_time, end_time: @shop_status.end_time, open: @shop_status.open, status: @shop_status.status } }, as: :json
    end

    assert_response 201
  end

  test "should show shop_status" do
    get shop_status_url(@shop_status), as: :json
    assert_response :success
  end

  test "should update shop_status" do
    patch shop_status_url(@shop_status), params: { shop_status: { begin_time: @shop_status.begin_time, end_time: @shop_status.end_time, open: @shop_status.open, status: @shop_status.status } }, as: :json
    assert_response 200
  end

  test "should destroy shop_status" do
    assert_difference('ShopStatus.count', -1) do
      delete shop_status_url(@shop_status), as: :json
    end

    assert_response 204
  end
end
