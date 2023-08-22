class BookingsController < ApplicationController

  before_action :set_fitness_equipment, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "Pending"
    @booking.fitness_equipment = @fitness_equipment
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      @booking = Booking.new
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def set_fitness_equipment
    @fitness_equipment = FitnessEquipment.find(params[:fitness_equipment_id])
  end


end
