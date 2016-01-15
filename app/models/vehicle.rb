class Vehicle < ActiveRecord::Base
  belongs_to :user

  def self.create_from_api(data, user)
    data.each do |vehicle|
      unless veh = Vehicle.find_by(vid: vehicle[:id])
        Vehicle.create!( { url:        vehicle[:url],
                           vid:        vehicle[:id],
                           vin:        vehicle[:vin],
                           make:       vehicle[:make],
                           model:      vehicle[:model],
                           submodel:   vehicle[:submodel],
                           year:       vehicle[:year],
                           fuel_grade: vehicle[:fuel_grade],
                           user_id:    user.id } )
      end
    end
  end
end
