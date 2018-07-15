class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :remark_name, :phone, :birthday, :avatar_url, :mp_openid, :app_openid, :token
end
