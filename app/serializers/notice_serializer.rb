class NoticeSerializer < ActiveModel::Serializer
  attributes :id, :content, :is_show, :is_home
  has_one :shop
end
