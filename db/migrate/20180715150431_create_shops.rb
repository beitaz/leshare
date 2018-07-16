class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name, comment: '店名'
      t.string :brand_name, comment: '店名'
      t.string :avatar, comment: '招牌'
      t.string :describe, comment: '描述'
      t.string :phone, comment: '电话'
      t.string :address, comment: '地址'
      t.string :detail_address, comment: '详细地址'
      t.string :longitude, comment: '经度'
      t.string :latitude, comment: '纬度'
      t.integer :le_area
      t.integer :in_shop
      t.integer :off_pay
      t.integer :support_member
      t.boolean :auto_order, comment: '自动排序'
      t.boolean :is_delete, comment: '标记删除'
      t.belongs_to :category
      
      t.datetime :expired_at
      t.timestamps
    end
  end
end
