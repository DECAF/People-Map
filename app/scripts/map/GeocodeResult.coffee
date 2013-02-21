class GeocodeResult
  constructor: (@_address, @_latitude, @_longitude) ->
    
  getAddress: ->
    @_address
  
  getLatitude: ->
    @_latitude
  
  getLongitude: ->
    @_longitude
  
window.GeocodeResult = GeocodeResult