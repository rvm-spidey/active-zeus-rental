class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    today = Date.today
    beginning_month = today.beginning_of_month
    end_month = today.end_of_month

    @top_equipments = FitnessEquipment.joins(:bookings)
                          .group('fitness_equipments.id')
                          .order('COUNT(bookings.id) DESC')
                          .limit(3)
                          .select('fitness_equipments.*, COUNT(bookings.id) AS booking_count')
                          .where('bookings.date_from >= ? and bookings.date_to <=?', beginning_month, end_month)
  end

end
