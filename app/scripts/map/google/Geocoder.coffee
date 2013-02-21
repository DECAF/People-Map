class Geocoder
  constructor : (@_$q, @_$scope)->
    @_geocoder = new google.maps.Geocoder

  geocode : (address) ->
    deferred = @_$q.defer()
    if address isnt ""
      request =
        address : address  
      @_geocoder.geocode request, (result) =>
        if not @_$scope.$$phase
          deferred.resolve @_getResultArray(result)
          @_$scope.$digest()
        else
          @_$scope.$apply =>
            deferred.resolve @_getResultArray(result)

    else
      deferred.reject 'Please provide a search string'

    return deferred.promise

  _getResultArray : (googleResults) ->
    (for result in googleResults
      latLng = result.geometry.location
      new GeocodeResult(result.formatted_address, latLng.lat(), latLng.lng())  
    )


window.Geocoder = Geocoder