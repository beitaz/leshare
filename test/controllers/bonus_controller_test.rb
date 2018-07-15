require 'test_helper'

class BonusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bonu = bonus(:one)
  end

  test "should get index" do
    get bonus_url, as: :json
    assert_response :success
  end

  test "should create bonu" do
    assert_difference('Bonu.count') do
      post bonus_url, params: { bonu: { cost_bonus_unit: @bonu.cost_bonus_unit, cost_money_unit: @bonu.cost_money_unit, increase_bonus: @bonu.increase_bonus, init_increase_bonus: @bonu.init_increase_bonus, is_cost: @bonu.is_cost, limit_money: @bonu.limit_money, max_increase_bonus: @bonu.max_increase_bonus, max_reduce_bonus: @bonu.max_reduce_bonus, reduce_money: @bonu.reduce_money } }, as: :json
    end

    assert_response 201
  end

  test "should show bonu" do
    get bonu_url(@bonu), as: :json
    assert_response :success
  end

  test "should update bonu" do
    patch bonu_url(@bonu), params: { bonu: { cost_bonus_unit: @bonu.cost_bonus_unit, cost_money_unit: @bonu.cost_money_unit, increase_bonus: @bonu.increase_bonus, init_increase_bonus: @bonu.init_increase_bonus, is_cost: @bonu.is_cost, limit_money: @bonu.limit_money, max_increase_bonus: @bonu.max_increase_bonus, max_reduce_bonus: @bonu.max_reduce_bonus, reduce_money: @bonu.reduce_money } }, as: :json
    assert_response 200
  end

  test "should destroy bonu" do
    assert_difference('Bonu.count', -1) do
      delete bonu_url(@bonu), as: :json
    end

    assert_response 204
  end
end
