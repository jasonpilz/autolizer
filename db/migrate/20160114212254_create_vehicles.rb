class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vid
      t.string :url
      t.string :make
      t.string :model
      t.string :vin
      t.string :submodel
      t.integer :year
      t.string :fuel_grade
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
