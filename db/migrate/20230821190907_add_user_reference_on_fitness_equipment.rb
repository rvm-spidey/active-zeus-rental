class AddUserReferenceOnFitnessEquipment < ActiveRecord::Migration[7.0]
  def change
    add_reference :fitness_equipments, :user, foreign_key: true
  end
end
