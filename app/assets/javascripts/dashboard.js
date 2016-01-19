$(document).on('page:change', function(event) {
  fetchVehicles()
  fetchLastTrip()
})

function fetchVehicles() {
  $.get("/current", function(currentUser) {
    $.ajax({ type: 'GET',
             url: 'https://api.automatic.com/vehicle/',
             headers: { "Authorization": "Bearer " + currentUser.oauth_access_token },
             success: function(vehicles) {
               renderVehicleStats(vehicles['results'][0])
             }
    })
  })
}

function renderVehicleStats(vehicle) {
  $('#vehicle-title')
    .hide()
    .append(vehicle.year + " " + vehicle.model)
    .transition('fade', '2000ms')

  $('#vehicle-fuel-percent')
    .hide()
    .append(vehicle.fuel_level_percent + " %")
    .transition('fade', '2000ms')

  $('#vehicle-dtc-count')
    .hide()
    .append(vehicle.active_dtcs.length)
    .transition('fade', '2000ms')
}

function fetchLastTrip() {
  $.get("/current", function(currentUser) {
    $.ajax({ type: 'GET',
             url: 'https://api.automatic.com/trip/',
             headers: { "Authorization": "Bearer " + currentUser.oauth_access_token },
             success: function(trips) {
               renderLastTrip(trips['results'][0])
             }
    })
  })
}

function renderLastTrip(trip) {
  $('#last-trip-distance').append(
    (trip.distance_m * 0.000621371).toFixed(2)
  )
  $('#last-trip-duration').append(
    (trip.duration_s / 60).toFixed(0)
  )
  $('#last-trip-cost').append(
    "$ "
    + trip.fuel_cost_usd
  )
  $('#last-trip-start').append(
    trip.start_address.display_name
  )
  $('#last-trip-end').append(
    trip.end_address.display_name
  )
  $('#last-trip-hard-brakes').append(
    trip.hard_brakes
  )
  $('#last-trip-hard-accels').append(
    trip.hard_accels
  )
  $('#last-trip-duration-70').append(
    trip.duration_over_70_s
  )
  $('#last-trip-fuel-economy')
    .hide()
    .append((trip.average_kmpl * 2.35214583).toFixed(2))
    .transition('fade', '2000ms')
}
