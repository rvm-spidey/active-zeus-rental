class AdminController < ApplicationController
  def index
    @mylistings = FitnessEquipment.where(user_id: current_user.id)
    puts "mylistings #{@mylistings}"
  end
end
