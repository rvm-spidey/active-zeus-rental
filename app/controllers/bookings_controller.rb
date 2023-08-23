class BookingsController < ApplicationController

  before_action :set_booking, only: %i[show edit update destroy]

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
    puts "des #{@booking}"
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end


end
