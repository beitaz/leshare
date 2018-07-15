class CardSerializer < ActiveModel::Serializer
  attributes :id, :background_pic_url, :color, :brand_name, :title, :prerogative, :notice, :description, :service_phone, :auto_activate, :supply_bonus, :supply_balance, :supply_discount, :supply_present, :quantity, :date_type, :begin_timestamp, :end_timestamp, :fixed_term, :fixed_begin_term
  has_one :shop
end
