class BookingsController < ApplicationController

  before_action :set_fitness_equipment, only: [:new, :create]
  before_action :set_booking, only: %i[show edit update destroy reject accept]

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

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def edit
  end

  def accept
    @booking.update(status: 'Accepted')
    redirect_to admin_index_path, notice: 'Booking accepted successfully.'
  end

  def reject
    @booking.update(status: 'Rejected')
    redirect_to admin_index_path, notice: 'Booking rejected.'
  end


  private

  def set_fitness_equipment
    @fitness_equipment = FitnessEquipment.find(params[:fitness_equipment_id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :fitness_equipment_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end


end
