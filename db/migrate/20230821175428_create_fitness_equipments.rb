class CreateFitnessEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :fitness_equipments do |t|
      t.string :name
      t.text :description
      t.boolean :available
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
