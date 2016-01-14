$(document).ready(function () {
  fetchUser()
  fetchVehicles()
})

function fetchUser() {
  $.get("/current", function(currentUser) {
    var oauth_token = currentUser.oauth_access_token
    fetchVehicles(oauth_token)
  })
}

function fetchVehicles(oauth_access_token) {
  $.ajax({ type: 'GET',
           url: 'https://api.automatic.com',
           headers: { 'Authorization':
}

