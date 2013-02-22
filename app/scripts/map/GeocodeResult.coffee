class GeocodeResult
  constructor : (@_address, @_latitude, @_longitude) ->

  getAddress  : ->
    @_address

  getLatitude : ->
    @_latitude

  getLongitude : ->
    @_longitude

angular.module('peopleMap.Map')
  .factory 'GeocodeResult', [() ->
             getResult : (address, latitude, longitude) ->
               new GeocodeResult address, latitude, longitude
           ]