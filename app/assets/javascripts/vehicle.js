$(document).on('page:change', function(event) {

  $('#maint-tab').click(function() {
    $('#maint-tab').addClass('active')
    $('#maint-list').addClass('active')
    $('#specs-tab').removeClass('active')
    $('#specs-list').removeClass('active')
  })

  $('#specs-tab').click(function() {
    $('#specs-tab').addClass('active')
    $('#specs-list').addClass('active')
    $('#maint-tab').removeClass('active')
    $('#maint-list').removeClass('active')
  })
  fetchSpecs()
})

function fetchVin() {
  var vin = document.getElementById("vin").textContent
  return vin
}

function fetchModelYear() {
  var year = document.getElementById("model-year").textContent
  return year
}

function fetchSpecs() {
  const vin = fetchVin()

  $.ajax({
    type: "GET",
    url:  "https://api.edmunds.com/api/vehicle/v2/vins/" + vin + "?api_key=trg2nxgnb9kd3kqxck22t6a2",
    success: function(specs) {
      renderSpecs(specs)
      fetchMaintenance()
    }
  })
}

function fetchMaintenance() {
  const modelYear = fetchModelYear()

  $.ajax({
    type: "GET",
    url:  "https://api.edmunds.com/v1/api/maintenance/actionrepository/findbymodelyearid?modelyearid="
          + modelYear + "&fmt=json&api_key=trg2nxgnb9kd3kqxck22t6a2",
    success: function(maintItems) {
      $.each(maintItems['actionHolder'], function(index, item){
        renderMaintenance(item)
      })
     }
  })
}

function renderMaintenance(item) {
  $("#maint-list").append(
    "<div class='ui vertical stripe segment'>"
    + "<div class='ui stackable internally celled grid'>"
    + "<div class='center aligned row'>"
    + "<div class='column' id='maint-category-column'>"
    + "<h3>"
    + item.item
    + "</h3>"
    + "</div>"
    + "<div class='column' id='maint-items-column'>"
    + "<p>Action: "
    + item.action
    + "</p>"
    + "<p>Interval Milage: "
    + item.intervalMileage.toLocaleString()
    + "</p>"
    + "<p>Interval Months: "
    + item.intervalMonth
    + "</p>"
    + "<p>Part Units: "
    + item.partUnits
    + "</p>"
    + "<p>Part Cost per Unit: "
    + item.partCostPerUnit
    + "</p>"
    + "<p>Labor Units: "
    + item.laborUnits + " Hour"
    + "</p>"
    + "<p>Description: "
    + item.itemDescription
    + "</p>"
    + "</div></div></div>")
}

function renderSpecs(specs) {
  $("#specs-list").append(
    "<div class='ui vertical stripe segment'>"
    + "<div class='ui stackable internally celled grid'>"
    + "<div class='center aligned row'>"
    + "<div class='column' id='category-column'>"
    + "<h3>General</h3>"
    + "</div>"
    + "<div class='column' id='specs-column'>"
    + "<p>Manufacturer: "
    + specs.make.name
    + "</p>"
    + "<p>Model: "
    + specs.model.name
    + "</p>"
    + "<p>Class: "
    + specs.categories.EPAClass
    + "</p>"
    + "ID: <p id='model-year'>" + specs.years[0].id + "</p>"
    + "</div></div></div>"
    + "<div class='ui vertical stripe segment'>"
    + "<div class='ui stackable internally celled grid'>"
    + "<div class='center aligned row'>"
    + "<div class='column' id='category-column'>"
    + "<h3>Chassis</h3>"
    + "</div>"
    + "<div class='column' id='specs-column'>"
    + "<p>Manufacturer Code: "
    + specs.manufacturerCode
    + "</p>"
    + "<p>Drivetrain: "
    + specs.drivenWheels
    + "</p>"
    + "<p>Doors: "
    + specs.numOfDoors
    + "</p>"
    + "<p>MPG Highway: "
    + specs.MPG.highway
    + "</p>"
    + "<p>MPG City: "
    + specs.MPG.city
    + "</p>"
    + "</div></div></div>"
    + "<div class='ui vertical stripe segment'>"
    + "<div class='ui stackable internally celled grid'>"
    + "<div class='center aligned row'>"
    + "<div class='column' id='category-column'>"
    + "<h3>Engine</h3>"
    + "</div>"
    + "<div class='column' id='specs-column'>"
    + "<p>Manufacturer Engine Code: "
    + specs.engine.manufacturerEngineCode
    + "</p>"
    + "<p>Engine Code: "
    + specs.engine.code
    + "</p>"
    + "<p>Displacement: "
    + specs.engine.displacement + "cc"
    + "</p>"
    + "<p>Size: "
    + specs.engine.size + "Liter"
    + "</p>"
    + "<p>Cylinders: "
    + specs.engine.cylinder
    + "</p>"
    + "<p>Configuration: "
    + specs.engine.configuration
    + "</p>"
    + "<p>Horsepower: "
    + specs.engine.horsepower
    + "</p>"
    + "<p>Torque: "
    + specs.engine.torque + "ft/lbs"
    + "</p>"
    + "<p>Compression Ratio: "
    + specs.engine.compressionRatio + " / 1"
    + "</p>"
    + "<p>Supercharger: "
    + specs.engine.compressorType
    + "</p>"
    + "<p>Valves: "
    + specs.engine.totalValves
    + "</p>"
    + "<p>Valve Timing: "
    + specs.engine.valve.timing
    + "</p>"
    + "<p>Valve Gear: "
    + specs.engine.valve.gear
    + "</p>"
    + "<p>Max Horsepower RPM: "
    + specs.engine.rpm.horsepower
    + "</p>"
    + "<p>Max Torque RPM: "
    + specs.engine.rpm.torque
    + "</p>"
    + "<p>Fuel Type: "
    + specs.engine.fuelType
    + "</p>"
    + "</div></div></div>" )
    // if (specs.price) {
    //   $("#specs-list").append(
    //     + "<div class='ui vertical stripe segment'>"
    //     + "<div class='ui stackable internally celled grid'>"
    //     + "<div class='center aligned row'>"
    //     + "<div class='column' id='category-column'>"
    //     + "<h3>Pricing</h3>"
    //     + "</div>"
    //     + "<div class='column' id='specs-column'>"
    //     + "<p>Base Invoice: $"
    //     + specs.price.baseInvoice.toLocaleString()
    //     + "</p>"
    //     + "<p>Base MSRP: $"
    //     + specs.price.baseMSRP.toLocaleString()
    //     + "</p>"
    //     + "<p>Used Trade-In: $"
    //     + specs.price.usedTradeIn.toLocaleString()
    //     + "</p>"
    //     + "<p>Used Private Sale: $"
    //     + specs.price.usedPrivateParty.toLocaleString()
    //     + "</p>"
    //     + "</div></div></div>"
    //   )
    // }
}

