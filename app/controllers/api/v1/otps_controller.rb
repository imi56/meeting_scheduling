module API::V1
  class OtpsController < APIController
    def create
      otp = Otp.upsert_otp(otp_params[:phone], Time.now + Otp::Constants::EXPIRY_DURATION)
      if otp.valid?
        otp.save!
        render_success(otp.otp_json, [], :created)
      else
        render_error('error', otp.errors.full_messages, :unprocessable_entity)
      end
    end

    private

    def otp_params
      params.permit(:phone)
    end
  end
end
