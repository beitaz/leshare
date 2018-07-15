require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get shops_url, as: :json
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { address: @shop.address, auto_order: @shop.auto_order, avatar: @shop.avatar, category_id: @shop.category_id, describe: @shop.describe, detail_address: @shop.detail_address, in_shop: @shop.in_shop, is_delete: @shop.is_delete, latitude: @shop.latitude, le_area: @shop.le_area, longitude: @shop.longitude, name: @shop.name, off_pay: @shop.off_pay, phone: @shop.phone, support_member: @shop.support_member } }, as: :json
    end

    assert_response 201
  end

  test "should show shop" do
    get shop_url(@shop), as: :json
    assert_response :success
  end

  test "should update shop" do
    patch shop_url(@shop), params: { shop: { address: @shop.address, auto_order: @shop.auto_order, avatar: @shop.avatar, category_id: @shop.category_id, describe: @shop.describe, detail_address: @shop.detail_address, in_shop: @shop.in_shop, is_delete: @shop.is_delete, latitude: @shop.latitude, le_area: @shop.le_area, longitude: @shop.longitude, name: @shop.name, off_pay: @shop.off_pay, phone: @shop.phone, support_member: @shop.support_member } }, as: :json
    assert_response 200
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete shop_url(@shop), as: :json
    end

    assert_response 204
  end
end
