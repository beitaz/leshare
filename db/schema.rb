# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180715162203) do

  create_table "bonus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "init_increase_bonus", default: 100, comment: "初始积分"
    t.integer "cost_money_unit", default: 1, comment: "消费金额单位"
    t.integer "increase_bonus", default: 1, comment: "积分增长数"
    t.integer "max_increase_bonus", default: 1000, comment: "单次最多增加积分"
    t.integer "cost_bonus_unit", default: 0, comment: "消费积分单位"
    t.integer "reduce_money", default: 0, comment: "立减金额"
    t.integer "limit_money", default: 100, comment: "限制立减金额"
    t.integer "max_reduce_bonus", default: 1000, comment: "单次最多消费积分"
    t.boolean "is_cost", default: true, comment: "能否使用"
    t.bigint "card_id", comment: "会员卡"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_bonus_on_card_id"
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", comment: "标题"
    t.string "color", comment: "颜色"
    t.string "background_pic_url", comment: "背景图片"
    t.string "prerogative", comment: "特权"
    t.string "notice", comment: "提示"
    t.string "description", comment: "描述"
    t.string "service_phone", comment: "客服电话"
    t.boolean "auto_activate", default: false, comment: "自动激活"
    t.boolean "supply_bonus", default: false, comment: "支持奖金(佣金)"
    t.boolean "supply_balance", default: false, comment: "支持余额"
    t.boolean "supply_discount", default: false, comment: "支持折扣"
    t.boolean "supply_present", default: false, comment: "支持体现"
    t.integer "quantity", comment: "数量"
    t.integer "date_type", comment: "日期类型"
    t.integer "begin_timestamp", comment: "开始时间"
    t.integer "end_timestamp", comment: "结束时间"
    t.boolean "fixed_term", default: false, comment: "固定期限"
    t.boolean "fixed_begin_term", default: false, comment: "固定开始期限"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_cards_on_shop_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nick_name", comment: "昵称"
    t.boolean "gender", default: false, comment: "性别"
    t.string "avatar_url", comment: "头像"
    t.string "province", comment: "省"
    t.string "city", comment: "市"
    t.string "country", comment: "区县"
    t.string "mp_openid", comment: "微信 openid"
    t.string "app_openid", comment: "微信 openid"
    t.string "token", comment: "微信 session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "昵称"
    t.string "remark_name", comment: "真实姓名"
    t.string "phone", comment: "手机"
    t.string "address", comment: "地址"
    t.date "birthday", comment: "生日"
    t.boolean "sex", default: false, comment: "性别"
    t.string "avatar_url", comment: "头像"
    t.integer "level", default: 1, comment: "会员等级"
    t.integer "level_name", comment: "等级名称"
    t.integer "upgrade_fee", default: 0
    t.integer "bonus", default: 0, comment: "奖金"
    t.integer "balance", default: 0, comment: "余额"
    t.string "code_url", comment: "我的二维码"
    t.integer "total_cost", default: 0, comment: "消费额"
    t.integer "custom_discount", default: 0, comment: "折扣"
    t.string "note", comment: "个人备注"
    t.string "token", comment: "微信 session"
    t.datetime "accept_time", comment: "加入时间"
    t.bigint "card_id", comment: "会员卡"
    t.bigint "customer_id", comment: "所属用户"
    t.bigint "shop_id", comment: "所属商户"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_members_on_card_id"
    t.index ["customer_id"], name: "index_members_on_customer_id"
    t.index ["shop_id"], name: "index_members_on_shop_id"
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content", comment: "通知内容"
    t.boolean "is_show", default: true, comment: "是否显示"
    t.boolean "is_home", default: true, comment: "是否首页显示"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_notices_on_shop_id"
  end

  create_table "shop_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status", default: "NORMAL", comment: "营业状态"
    t.string "begin_time", default: "00:00", comment: "上班时间"
    t.string "end_time", default: "23:59", comment: "下班时间"
    t.boolean "open", default: true, comment: "正在营业"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "店名"
    t.string "brand_name", comment: "店名"
    t.string "avatar", comment: "招牌"
    t.string "describe", comment: "描述"
    t.string "phone", comment: "电话"
    t.string "address", comment: "地址"
    t.string "detail_address", comment: "详细地址"
    t.string "longitude", comment: "经度"
    t.string "latitude", comment: "纬度"
    t.integer "le_area"
    t.integer "in_shop"
    t.integer "off_pay"
    t.integer "support_member"
    t.boolean "auto_order", comment: "自动排序"
    t.boolean "is_delete", comment: "标记删除"
    t.bigint "category_id"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_shops_on_category_id"
  end

  add_foreign_key "bonus", "cards"
  add_foreign_key "cards", "shops"
  add_foreign_key "notices", "shops"
end
