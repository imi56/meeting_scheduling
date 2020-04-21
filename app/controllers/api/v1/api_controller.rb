module API::V1
  class APIController < BaseAPIController
    def authenticate_user!
      dt = validate_params
      @current_user = User.find_by(uuid: dt[:uuid])
      raise Exceptions::NotAuthenticatedError if @current_user.blank?
    end

    def current_user
      @current_user
    end
  end
end