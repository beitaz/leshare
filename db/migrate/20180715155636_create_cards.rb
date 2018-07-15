class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title, comment: '标题'
      t.string :color, comment: '颜色'
      t.string :background_pic_url, comment: '背景图片'
      t.string :prerogative, comment: '特权'
      t.string :notice, comment: '提示'
      t.string :description, comment: '描述'
      t.string :service_phone, comment: '客服电话'
      t.boolean :auto_activate, default: false, comment: '自动激活'
      t.boolean :supply_bonus, default: false, comment: '支持奖金(佣金)'
      t.boolean :supply_balance, default: false, comment: '支持余额'
      t.boolean :supply_discount, default: false, comment: '支持折扣'
      t.boolean :supply_present, default: false, comment: '支持体现'
      t.integer :quantity, comment: '数量'
      t.integer :date_type, comment: '日期类型'
      t.integer :begin_timestamp, comment: '开始时间'
      t.integer :end_timestamp, comment: '结束时间'
      t.boolean :fixed_term, default: false, comment: '固定期限'
      t.boolean :fixed_begin_term, default: false, comment: '固定开始期限'

      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
