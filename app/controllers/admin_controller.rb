class AdminController < ApplicationController

  def index
    @mylistings = FitnessEquipment.where(user_id: current_user.id)

    # @booked_equipments = Booking.all
    @booked_equipments = get_bookings_made
  end

  private

  def get_bookings_made
    Booking.all.where.not(user_id: current_user.id).where(status: "Pending")
  end

end
