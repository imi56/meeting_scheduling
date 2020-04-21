module API::V1
  class SlotsController < APIController
    before_action :authenticate_user!
    def index
      slots = Slot.all.map {|s| s.slot_json}
      render_success(slots)
    end
  end
end