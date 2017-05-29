/**
 * Created by GD on 5/11/2015.
 */

var map;


/*! Initialize the map using the specified coordinates and zoom level and add the OpenStreetMaps layer*/
function init(lat,lng) {

    map = L.map( 'map', {
        center: [lat, lng],
        minZoom: 2,
        maxZoom: 19,
        zoom: 2
    });

    L.tileLayer( 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        subdomains: ['a', 'b', 'c']
    }).addTo( map );

    map.setZoom(17);

}


/*! Create a leaflet marker that can be add to the map at selected coordinates*/
function createMarker(lat, lng,name,popupContent){
    var aMarker = L.marker([lat, lng]);
    aMarker.bindPopup(name);
    aMarker.addTo(map);
    aMarker.openPopup();

}


