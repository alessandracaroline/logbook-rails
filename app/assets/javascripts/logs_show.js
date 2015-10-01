$(document).on("sailor:logs_show", function(){
  // var map;
  initMap();
});

function initMap() {
    var latitude = $('#log_latitude').val();
    var longitude = $('#log_longitude').val();
    var myLatLng = {lat: Number(latitude), lng: Number(longitude)};

    console.log(myLatLng)

    var map = new google.maps.Map(document.getElementById('map'), {
      center: myLatLng,
      zoom: 11
    });

    console.log(map)
    $('#map').append(map)

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Your log!'
    });
  }