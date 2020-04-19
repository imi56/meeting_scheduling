module API::V1
  class OtpSerializer < ActiveModel::Serializer
    type 'data'
    attributes :password

    def password
      Rails.env.production? ? '' : object.password
    end
  end
end