// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

  
var request = new XMLHttpRequest();

function callServer() {
  var car = document.getElementById('car').value;
  var url = '/cars/show/' + car + '.xml';
  request.open('GET', url, true);
  request.onreadystatechange = updatepage;
  request.send(null);

}

function updatepage() {
  if (request.readyState == 4){
    var response = request.responseXML;
    var path = "//name";
    var nodes = response.evaluate(path, response, null, XPathResult.ANY_TYPE, null);
    var result = nodes.iterateNext();
    document.getElementById('change').innerHTML = result.childNodes[0].nodeValue;
  };
}
