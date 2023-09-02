class BookingsController < ApplicationController

  before_action :set_fitness_equipment, only: [:new, :create]
  before_action :set_booking, only: %i[show edit update destroy reject accept]

  def index
    @bookings = Booking.all.order(date_from: :desc).where('user_id = ? AND date_to >= ?', current_user.id, Date.today)

    @previous_bookings = Booking.all.order(date_from: :desc).where('user_id = ? AND date_to < ?', current_user.id, Date.today)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "Pending"
    @booking.fitness_equipment = @fitness_equipment
    @booking.user = current_user

    days_diff = (@booking.date_to - @booking.date_from).to_i
    @booking.total = days_diff * @fitness_equipment.price

    @booking_exists = Booking.where(fitness_equipment_id: @fitness_equipment.id).where('date_from >= ? AND date_to<= ?',@booking.date_from, @booking.date_to).count

    # if @booking.save
    #   redirect_to bookings_path
    # end

    if @booking_exists > 0
      @booking.errors.add(:base, "There is already a booking for this date range")
      # render :new, status: :unprocessable_entity
    elsif @booking.save
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

  def update
    @booking.update(booking_params)
    days_diff = (@booking.date_to - @booking.date_from).to_i
    @fitness_equipment_booking = FitnessEquipment.find(@booking.fitness_equipment_id)
    @booking.total = days_diff * @fitness_equipment_booking.price
    @booking.save

    redirect_to bookings_path
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
    params.require(:booking).permit(:date_from, :date_to, :fitness_equipment_id, :status, :total)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
