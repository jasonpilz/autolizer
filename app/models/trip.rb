class Trip < ActiveRecord::Base
  belongs_to :vehicle

  def self.create_from_api(data)
    data.each do |trip|
      if trip
        vehicle_id = Vehicle.find_by(url: trip[:vehicle]).id
        unless found = Trip.find_by(tid: trip[:id])
          Trip.create( { vehicle_id:            vehicle_id,
                         average_kmpl:          trip[:average_kmpl],
                         vehicle_url:           trip[:url],
                         started_at:            trip[:started_at],
                         start_timezone:        trip[:start_timezone],
                         average_from_epa_kmpl: trip[:average_from_epa_kmpl],
                         fuel_cost_usd:         trip[:fuel_cost_usd],
                         fuel_volume_l:         trip[:fuel_volume_l],
                         tid:                   trip[:id],
                         distance_m:            trip[:distance_m],
                         ended_at:              trip[:ended_at],
                         end_timezone:          trip[:end_timezone],
                         user_url:              trip[:user],
                         idling_time_s:         trip[:idling_time_s],
                         duration_s:            trip[:duration_s],
                         path:                  trip[:path],
                         start_address:         trip[:start_address][:name],
                         end_address:           trip[:end_address][:name],
                         start_lon:             trip[:start_location][:lon],
                         start_lat:             trip[:start_location][:lat],
                         end_lon:               trip[:end_location][:lon],
                         end_lat:               trip[:end_location][:lat] } )
        end
      end
    end
  end
end
