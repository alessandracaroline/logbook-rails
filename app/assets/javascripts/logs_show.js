$(document).on("sailor:logs_show", function(){
  var map;
  initMap();
});

function initMap() {
    var latitude = $('#log_latitude').val();
    var longitude = $('#log_longitude').val();
    var myLatLng = {lat: Number(latitude), lng: Number(longitude)};
    var mapDiv = document.getElementById('map');
    var mapOptions = {
      center: myLatLng,
      zoom: 11
    }

    console.log(myLatLng)

    map = new google.maps.Map(mapDiv, mapOptions);

    console.log(map)

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Your log!'
    });
  }


  // google.maps.event.addDomListener(window, 'load', function() {
  //   var canvas = document.getElementById("map-canvas");
  //   var mapOptions = {
  //     center: new google.maps.LatLng(40.714352, -74.005973),
  //     zoom:   7
  //   };

  //   var map = new google.maps.Map(canvas, mapOptions);
  // });