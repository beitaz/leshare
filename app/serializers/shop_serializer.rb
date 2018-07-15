class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar, :address, :detail_address, :phone, :longitude, :latitude, :describe, :auto_order, :le_area, :off_pay, :in_shop, :support_member, :is_delete
  has_one :category
end
