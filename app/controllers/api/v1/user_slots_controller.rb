module API::V1
  class UserSlotsController < APIController
    before_action :authenticate_user!
    before_action :validate_date, only: :create

    def index
      slots = current_user.slots.map {|s| s.slot_json}
      render_success(slots, ['Here are the available slots for booking.'])
    end

    def create
      render_error(["slot ids are required"]) and return if params[:slot_ids].blank?
      UserSlot.insert_all(slot_data, unique_by: [:user_id, :slot_id, :slot_date])
      render_success({}, ['Mapped successfully'], :created)
    end

    private

    def slot_data
      data = []
      params[:slot_ids].each do |id|
        data << { slot_date: params[:slot_date], slot_id: id, user_id: current_user.id }
      end
      data
    end

    def validate_date
      dt = Date.parse(params[:slot_date]) rescue nil
      render_error(['Valid slot date format(yyyy-mm-dd) is rquired']) and return if dt.nil?
    end
  end
end