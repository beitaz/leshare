class ShopStatusSerializer < ActiveModel::Serializer
  attributes :id, :status, :begin_time, :end_time, :open
end
