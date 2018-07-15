class CreateShopStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_statuses do |t|
      t.string :status, default: 'NORMAL', comment: '营业状态'
      t.string :begin_time, default: '00:00', comment: '上班时间'
      t.string :end_time, default: '23:59', comment: '下班时间'
      t.boolean :open, default: true, comment: '正在营业'

      t.timestamps
    end
  end
end
