class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.decimal :average_kmpl
      t.references :vehicle, index: true, foreign_key: true
      t.string :vehicle_url
      t.datetime :started_at
      t.string :start_timezone
      t.decimal :average_from_epa_kmpl
      t.decimal :fuel_cost_usd
      t.decimal :fuel_volume_l
      t.string :tid
      t.decimal :distance_m
      t.datetime :ended_at
      t.string :end_timezone
      t.string :user_url
      t.integer :idling_time_s
      t.decimal :duration_s
      t.string :path
      t.string :start_address
      t.string :end_address
      t.decimal :start_lon
      t.decimal :start_lat
      t.decimal :end_lon
      t.decimal :end_lat

      t.timestamps null: false
    end
  end
end
