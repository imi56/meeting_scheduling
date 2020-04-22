module API::V1
  class MeetingsController < APIController
    before_action :authenticate_user!
    before_action :find_meeting, only: :create

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

    def find_meeting
      @meeting = Meeting.find_by(id: params[:id])
      render_error(['No such meeting found'], 'failed', :not_found) if @meeting.nil?
    end

    def create_params
      params.permit(
        :user_slot_id
      )
    end
  end
end