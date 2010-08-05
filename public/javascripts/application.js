// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//TBD: unescape url parameters, evalue nodes to get markers
  
var request = new XMLHttpRequest();
var markers =[];
var infoWindow;

function callServer() {
  //var loc = getQuery('location');
  //var car_id = getQuery('car_id');
  //var url = '/posts.xml?location=' + loc + '&car_id=' + car_id ;
  var url = get_url_in_xml();
  request.open('GET', url, true);
  request.onreadystatechange = updatepage;
  request.send(null);
};

function get_url_in_xml(){
  var s = location.href;
  var temp_url = s.split('?');
  return temp_url[0] + '.xml?' + temp_url[1];

};

function initialize(){
  var latlng = new google.maps.LatLng(43.6572537,-79.3965247);
  infoWindow = new google.maps.InfoWindow();
  var myOptions = {
    zoom: 13,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  //put location marker
  var marker = new google.maps.Marker({
      map: map, 
      position: latlng//results[0].geometry.location
  });
};

function updatepage() {
  if (request.readyState == 4){
    var xml = request.responseXML;
    var markerNodes = xml.documentElement.getElementsByTagName("marker");
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0; i < markerNodes.length; i++) {
      var name = markerNodes[i].getAttribute("name");
      var address = markerNodes[i].getAttribute("address");
      var distance = parseFloat(markerNodes[i].getAttribute("distance"));
      var latlng = new google.maps.LatLng(
          parseFloat(markerNodes[i].getAttribute("lat")),
          parseFloat(markerNodes[i].getAttribute("lng"))
      );

      //createOption(name, distance, i);
      createMarker(latlng, name, address);
      bounds.extend(latlng);
    }
    
    //var path = "/markers/marker";
    //var nodes = response.evaluate(path, response, null, XPathResult.ANY_TYPE, null);
    //var result = nodes.iterateNext();
    //document.getElementById('change').innerHTML = result.childNodes[0].nodeValue;
  };
};

function createMarker(latlng,name,address){
  var html = "<b>" + name + "</b> <br/>" + address;
  var marker = new google.maps.Marker({
    map: map,
    position: latlng
  });
  google.maps.event.addListener(marker, 'mouseover', function() {
    infoWindow.setContent(html);
    infoWindow.open(map, marker);
  });
  markers.push(marker);
};

function codeAddress() {
  var address = document.getElementById("address").value;
        //map.setCenter(results[0].geometry.location);
  map.setZoom(13);
  var mylatlng = new google.maps.LatLng(-30.0, 140.0); //var latlng = new google.maps.LatLng(-33.397, 150.644);

  var latlng = new google.maps.LatLng(40.6019274, -79.7571664);
  var marker = new google.maps.Marker({
      map: map, 
      position: latlng//results[0].geometry.location
  });
};

function getQuery(param){
  q = location.search;
  q = q.substring(1).split('&');
  var query = ''
  for (var i = 0; i < q.length; i++){
    if ( q[i].slice(0,q[i].indexOf('=')) == param) {
       console.log(q[i].slice(q[i].indexOf('=')+1));
       break;
    }  
  }
  return (query.length > 0 ? unescape(query).split(',') : '')
};

