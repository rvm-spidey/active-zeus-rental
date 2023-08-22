class Booking < ApplicationRecord
  belongs_to :fitness_equipment
  belongs_to :user
end
