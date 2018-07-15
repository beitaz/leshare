class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name, comment: '昵称'
      t.string :remark_name, comment: '真实姓名'
      t.string :phone, comment: '手机'
      t.string :address, comment: '地址'
      t.date :birthday, comment: '生日'
      t.boolean :sex, default: false, comment: '性别'
      t.string :avatar_url, comment: '头像'
      t.integer :level, default: 1, comment: '会员等级'
      t.integer :level_name, comment: '等级名称'
      t.integer :upgrade_fee, default: 0, comment: ''
      t.integer :bonus, default: 0, comment: '奖金'
      t.integer :balance, default: 0, comment: '余额'
      t.string :code_url, comment: '我的二维码'
      t.integer :total_cost, default: 0, comment: '消费额'
      t.integer :custom_discount, default: 0, comment: '折扣'
      t.string :note, comment: '个人备注'
      t.string :token, comment: '微信 session'
      t.datetime :accept_time, comment: '加入时间'

      t.belongs_to :card, comment: '会员卡'
      t.belongs_to :customer, comment: '所属用户'
      t.belongs_to :shop, comment: '所属商户'
      
      t.timestamps
    end
  end
end
