	// location:
	var displayUserLocation=true;
	var radius = 50;
	var userLocationmarker;
	var userLocationCircle;
	var userLocationIcon = L.icon({
    iconUrl: 'marker-icon-you-are-here.png',
		// shadowUrl: 'leaf-shadow.png',
		iconSize:     [26, 55], // size of the icon
		// shadowSize:   [50, 64], // size of the shadow
		iconAnchor:   [11, 55], // point of the icon which will correspond to marker's location
		// shadowAnchor: [4, 62],  // the same for the shadow
		popupAnchor:  [3, -50] // point from which the popup should open relative to the iconAnchor
	});
		var userLocationCircleOptions =
		{
			stroke: false,
			color: 'red',
			weight:	1,
			fillColor: '#f03',
			fillOpacity: 0.2
		}
		
	map.on('locationfound', onLocationFound);
	map.on('locationerror', onLocationError);
	map.on('locationwarning', onLocationWarning);

		function onLocationFound(e) {
		// console.log("displayUserLocation: " + displayUserLocation);
		if(displayUserLocation){
		if(!userLocationmarker && !userLocationCircle){
		 //first display
		  userLocationmarker=L.marker(e.latlng,{icon: userLocationIcon}).addTo(map).bindPopup("<b>You are here</b>");
		  userLocationCircle =L.circle(e.latlng, radius,userLocationCircleOptions).addTo(map);
		 // check if user location is inside map bounds and pan to user location if it is not visible
		 if(viewableBounds.contains(e.latlng)){
		   // check if it is visible
		   if(!map.getBounds().contains(e.latlng)){
		    map.setView(e.latlng);
		   }
		 } else {
			updateUserLocationOnWarning("Your location is outside map bounds");
		 }
		 
		} else {
		 userLocationmarker.setLatLng(e.latlng);
		 userLocationCircle.setLatLng(e.latlng);
		 }
		
		 }
		}

		function onLocationError(e) {
			if(displayUserLocation)
				alert(e.message);
			setDisplayUserLocation(false);
		}
		
		
		function onLocationWarning(e) {
			if(displayUserLocation)
				alert(e.message);
		}
	
	function setDisplayUserLocation(display) {
	 displayUserLocation=display;
		if(!displayUserLocation && userLocationmarker){
			 map.removeLayer(userLocationmarker);
			 userLocationmarker=null;
		} 
		if(!displayUserLocation && userLocationCircle){
		 map.removeLayer(userLocationCircle);
		 userLocationCircle=null;
		} 
		 
	}
	
	function updateUserLocation(lat,lng) {
		var latlngPoint = new L.LatLng(lat, lng)
		map.fireEvent('locationfound', {
		latlng: latlngPoint
		});
	}
	
	function updateUserLocationOnError(error) {
		map.fireEvent('locationerror', {
		message: error
		});
	}
	
	function updateUserLocationOnWarning(warning) {
		map.fireEvent('locationwarning', {
		message: warning
		});
	}
	var showMyLocationButton = L.easyButton({
    states: [{
            stateName: 'display-my-location',   // name the state
            icon:      'display-my-location',  // and define its properties
            title:     'display my location', // like its title
 			onClick: function(btn, map) {  // and its callback
				setDisplayUserLocation(true);
                btn.state('hide-my-location'); // change state on click!
            }
			}, {
            stateName: 'hide-my-location',
            icon:      'hide-my-location',
            title:     'hide my location',
            onClick: function(btn, map) {  // and its callback
				setDisplayUserLocation(false);
                btn.state('display-my-location'); // change state on click!
			}
			}]
	});
	showMyLocationButton.addTo(map);
	