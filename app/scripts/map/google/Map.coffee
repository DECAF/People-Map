class Map
  _map     : null
  _gLatLng : null

  constructor : (@_el) ->
    @_setLatLng Map.DEFAULT_LATITUDE, Map.DEFAULT_LONGITUDE
    @_zoom = Map.DEFAULT_ZOOM


  _setLatLng : (lat, lng) ->
    @_gLatLng = new google.maps.LatLng lat, lng

  _getLatLng : ->
    @_gLatLng

  setCenter : (lat, lng) ->
    @_setLatLng lat, lng
    @_map?.setCenter @_getLatLng()

  setZoom : (zoom) ->

  load    : ->
    mapOptions =
      zoom      : @_zoom
      center    : @_getLatLng()
      #disableDefaultUI : true,
      mapTypeId : google.maps.MapTypeId.ROADMAP

    @_map = new google.maps.Map(@_el, mapOptions)


Map.DEFAULT_LATITUDE = 0
Map.DEFAULT_LONGITUDE = 0
Map.DEFAULT_ZOOM = 8

window.Map = Map