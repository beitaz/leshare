require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url, as: :json
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { auto_activate: @card.auto_activate, background_pic_url: @card.background_pic_url, begin_timestamp: @card.begin_timestamp, brand_name: @card.brand_name, color: @card.color, date_type: @card.date_type, description: @card.description, end_timestamp: @card.end_timestamp, fixed_begin_term: @card.fixed_begin_term, fixed_term: @card.fixed_term, notice: @card.notice, prerogative: @card.prerogative, quantity: @card.quantity, service_phone: @card.service_phone, shop_id: @card.shop_id, supply_balance: @card.supply_balance, supply_bonus: @card.supply_bonus, supply_discount: @card.supply_discount, supply_present: @card.supply_present, title: @card.title } }, as: :json
    end

    assert_response 201
  end

  test "should show card" do
    get card_url(@card), as: :json
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { auto_activate: @card.auto_activate, background_pic_url: @card.background_pic_url, begin_timestamp: @card.begin_timestamp, brand_name: @card.brand_name, color: @card.color, date_type: @card.date_type, description: @card.description, end_timestamp: @card.end_timestamp, fixed_begin_term: @card.fixed_begin_term, fixed_term: @card.fixed_term, notice: @card.notice, prerogative: @card.prerogative, quantity: @card.quantity, service_phone: @card.service_phone, shop_id: @card.shop_id, supply_balance: @card.supply_balance, supply_bonus: @card.supply_bonus, supply_discount: @card.supply_discount, supply_present: @card.supply_present, title: @card.title } }, as: :json
    assert_response 200
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card), as: :json
    end

    assert_response 204
  end
end
