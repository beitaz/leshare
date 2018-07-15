class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :nick_name, comment: '昵称'
      t.boolean :gender, default: 0, comment: '性别'
      t.string :avatar_url, comment: '头像'
      t.string :province, comment: '省'
      t.string :city, comment: '市'
      t.string :country, comment: '区县'
      t.string :mp_openid, comment: '微信 openid'
      t.string :app_openid, comment: '微信 openid'
      t.string :token, comment: '微信 session'

      t.timestamps
    end
  end
end
