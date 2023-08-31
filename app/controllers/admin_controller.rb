class AdminController < ApplicationController

  def index
    @mylistings = FitnessEquipment.where(user_id: current_user.id)

    @booked_equipments = get_bookings_made

    @top_booked = get_top_booked_equipments
  end

  private

  def get_bookings_made
    Booking.all.where.not(user_id: current_user.id)
    # .where(status: "Pending")
  end

  def get_top_booked_equipments
    FitnessEquipment.joins(:bookings)
                          .group('fitness_equipments.id')
                          .order('COUNT(bookings.id) DESC')
                          .limit(3)
                          .select('fitness_equipments.*, COUNT(bookings.id) AS booking_count')
                          .where(user_id: current_user.id)
  end

end
