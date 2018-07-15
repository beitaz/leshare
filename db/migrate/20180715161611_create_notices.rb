class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.string :content, comment: '通知内容'
      t.boolean :is_show, default: true, comment: '是否显示'
      t.boolean :is_home, default: true, comment: '是否首页显示'

      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
