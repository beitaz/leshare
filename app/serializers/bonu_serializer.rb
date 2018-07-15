class BonuSerializer < ActiveModel::Serializer
  attributes :id, :init_increase_bonus, :cost_money_unit, :increase_bonus, :max_increase_bonus, :cost_bonus_unit, :reduce_money, :limit_money, :max_reduce_bonus, :is_cost
end
