module API::V1
  class MeetingsController < APIController
    before_action :authenticate_user!
    before_action :find_user_slot, only: [:create]
    before_action :check_meeting, only: [:create]

    def create
      meeting = Meeting.new(create_params)
      meeting.booked_by = current_user
      if meeting.valid?
        meeting.save!
        render_success(meeting.meeting_json)
      else
        render_error(meeting.errors.full_messages)
      end
    end

    private

    def check_meeting
      render_error(['You can not schedule meeting with yourself.']) if @user_slot.user_id == current_user.id
    end

    def find_user_slot
      @user_slot = UserSlot.find_by(id: params[:user_slot_id])
      render_error(['No such user slot exists, please map the slot first.'], :failed, :not_found) if @user_slot.nil?
    end

    def create_params
      params.permit(
        :user_slot_id
      )
    end
  end
end