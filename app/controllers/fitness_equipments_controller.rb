class FitnessEquipmentsController < ApplicationController

  before_action :set_equipment, only: [:show]

  def index
    @equipments = FitnessEquipment.all
    @categories = Category.all
  end

  def show
    @category = Category.find(@equipment.category_id)
    @owner = User.find(@equipment.user_id)
    @booking = Booking.new(fitness_equipment: @equipment)
  end

  def new
    @equipment = FitnessEquipment.new
  end

  def create
    @equipment = FitnessEquipment.new(equipment_params)
    @equipment.user_id = current_user.id
    @equipment.available = true

    @equipment.save
    if @equipment.save
      redirect_to admin_path
      # redirect_to fitness_equipment_path(@equipment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_equipment
    @equipment = FitnessEquipment.find(params[:id])
  end

  def equipment_params
    params.require(:fitness_equipment).permit(:name, :category_id, :description, :price)
  end
end
