class AdminController < ApplicationController

  def index
    @mylistings = FitnessEquipment.where(user_id: current_user.id)

    @booked_equipments = FitnessEquipment.where(user_id: current_user.id)
  end
end
