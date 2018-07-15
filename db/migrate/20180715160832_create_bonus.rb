class CreateBonus < ActiveRecord::Migration[5.1]
  def change
    create_table :bonus do |t|
      t.integer :init_increase_bonus, default: 100, comment: '初始积分'
      t.integer :cost_money_unit, default: 1, comment: '消费金额单位'
      t.integer :increase_bonus, default: 1, comment: '积分增长数'
      t.integer :max_increase_bonus, default: 1000, comment: '单次最多增加积分'
      t.integer :cost_bonus_unit, default: 0, comment: '消费积分单位'
      t.integer :reduce_money, default: 0, comment: '立减金额'
      t.integer :limit_money, default: 100, comment: '限制立减金额'
      t.integer :max_reduce_bonus, default: 1000, comment: '单次最多消费积分'
      t.boolean :is_cost, default: true, comment: '能否使用'

      t.belongs_to :card, foreign_key: true, comment: '会员卡'
      t.timestamps
    end
  end
end
