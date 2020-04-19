module API::V1
  class UserSerializer < ActiveModel::Serializer
    type 'data'
    attributes :full_name, :phone
  end
end