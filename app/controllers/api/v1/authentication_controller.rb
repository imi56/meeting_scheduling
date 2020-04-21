module API::V1
  class AuthenticationController < APIController
    attr_reader :user
    before_action :find_user, only: [:login]
    before_action :remove_attr_for_guest, only: [:sign_up]
    before_action :verify_otp, only: [:login, :sign_up]
    #region dependencies
      require 'jwt_auth_token'
      include AuthHelper
    #endregion dependencies

    def sign_up
      render_error( ['Phone already registered, please login']) and return if user.present?
      user = User.new(user_params)
      if user.save
        deleteOtp(params[:phone])
        response  = get_token_data({ uuid: user.uuid, guest: user.guest? })
        render json: { sign_up: response }, status: :ok
      else
        render_error(user.errors) and return
      end

    end

    def login
      render_error( ['Phone not registered, please sign up']) and return if user.blank?
      deleteOtp(params[:phone]) if params[:guest].to_s != "true"
      response = get_token_data({ uuid: user.uuid, guest: user.guest })
      render json: { login: response }, status: :ok
    end

    private

    def guest?
      params[:guest].to_s == "true" || @user.guest?
    end

    def verify_otp
      return if guest?
      render_error(['Invalid OTP']) and return unless Otp.verify(params[:phone], params[:otp])
    end

    def find_user
      @user = User.find_by(uuid: params[:uuid])
    end

    def deleteOtp(phone)
      otp = Otp.where(phone: phone)
      otp.destroy_all if otp.present?
    end

    def user_params
      params.permit( :full_name, :phone, :guest)
    end

    def remove_attr_for_guest
      params.delete(:phone)
      params.delete(:otp)
    end
  end
end
