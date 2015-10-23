new Ajax.Request( 'cities.xml', { 
  method: 'get',
  onSuccess: function( transport ) {
	var city_tags = transport.responseXML.getElementsByTagName ('cities');

	var elTR = $('cities').insertRow( -1 );
	var elTD1 = elTR.insertCell( -1 );
	elTD1.innerHTML = "id";
	var elTD2 = elTR.insertCell( -1 );
	elTD2.innerHTML = "name";
	var elTD3 = elTR.insertCell( -1 );
	elTD3.innerHTML = "population";
	var elTD4 = elTR.insertCell( -1 );
	elTD4.innerHTML = "date_mod";

	for( var b = 0; b < city_tags.length; b++ ) {
      var id = city_tags[b].getElementsByTagName('id')[0].firstChild.nodeValue;
      var name = city_tags[b].getElementsByTagName('name')[0].firstChild.nodeValue;
      var population = 
	city_tags[b].getElementsByTagName('population')[0].firstChild.nodeValue;
      var date_mod = 
	city_tags[b].getElementsByTagName('date_mod')[0].firstChild.nodeValue;

      var elTR = $('cities').insertRow( -1 );
      var elTD1 = elTR.insertCell( -1 );
      elTD1.innerHTML = id;
      var elTD2 = elTR.insertCell( -1 );
      elTD2.innerHTML = name;
      var elTD3 = elTR.insertCell( -1 );
      elTD3.innerHTML = population;
      var elTD4 = elTR.insertCell( -1 );
      elTD4.innerHTML = date_mod;
	}
	}
});
