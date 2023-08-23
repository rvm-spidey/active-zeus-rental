class AdminController < ApplicationController

  before_action :set_fitness_equipment, only: %i[destroy]

  def index
    @mylistings = FitnessEquipment.where(user_id: current_user.id)

    @booked_equipments = get_bookings_made
  end

  def destroy
    @fitness_equipment.destroy!
    redirect_to admin_path, status: :see_other
  end

  private

  def get_bookings_made
    Booking.all.where.not(user_id: current_user.id).where(status: "Pending")
  end

  def set_fitness_equipment
    @fitness_equipment = FitnessEquipment.find(params[:id])
  end
end
