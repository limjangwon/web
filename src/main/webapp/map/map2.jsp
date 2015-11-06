<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>map2.jsp</title>
<style type="text/css">
      html, body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
      	width: 100%;
        height: 100%;
      }

</style>
</head>

<body>
<button id="loc1">강남역</button>
<button id="loc2">이대역</button>
<button id="loc3">광화문</button>
<button id="loc4">우리집</button>

<div id="map">Google Map</div>

<script src="https://maps.googleapis.com/maps/api/js"></script>
        
<script type="text/javascript">
	var latLng = {
			lat : 37.12345,
			lng : 127.12345
	};
	
	var options = {
		zoom : 18,
		center : latLng
	};
	
	var m = new google.maps.Map(map, options);
	
	m.setCenter({
 		lat : 38.498384,
		lng : 117.027535  
	});
	
	m.setZoom(18);
	
	var geoCoder = new google.maps.Geocoder();
	
	
	function moveMap() {
		
		switch (this.id) {
		case "loc1":
			console.log("강남역으로...");
			
			geoCoder.geocode({address: '강남역'}, function(result, status) {
				console.dir(result);
				console.dir(status);
				console.dir(geoCoder);
				
				var lat = result[0].geometry.location.lat();
				var lng = result[0].geometry.location.lng();
				
				console.log("lat = " + lat);
				console.log("lng = " + lng);
				
				m.setCenter({
					lat : lat,
					lng : lng
					
				});
				m.setZoom(17);
			});
			
		
			break;
		case "loc2":
			console.log("이대역으로...");
			m.panTo({
				lat: 37.557033,
				lng: 126.945857
			});
			m.setZoom(18);
			break;
		case "loc3":
			console.log("광화문으로...");
			m.panTo({
				lat : 37.571785,
				lng : 126.976602
			});
			m.setZoom(18);
			break;
		case "loc4":
			console.log("집으로...");
			m.setCenter({
				lat : 37.498257,
				lng : 127.027578
			});
			m.setZoom(18);
			break;
			
		default:
			break;
		}		
	}
	
	loc1.onclick = moveMap;
	loc2.onclick = moveMap;
	loc3.onclick = moveMap;
	loc4.onclick = moveMap;
	
</script>

</body>
</html>