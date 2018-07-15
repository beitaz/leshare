class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :remark_name, :phone, :birthday, :sex, :avatar_url, :openid, :token
end
