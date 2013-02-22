class Geocoder
  constructor : (@_$q, @_$scope, @_resultService)->
    @_geocoder = new google.maps.Geocoder

  geocode : (address) ->
    deferred = @_$q.defer()
    if address isnt ""
      request =
        address : address  
      @_geocoder.geocode request, (result) =>
        deferred.resolve @_getResultArray(result)
        @_$scope.$digest()

    else
      deferred.reject 'Please provide a search string'

    return deferred.promise

  _getResultArray : (googleResults) ->
    (for result in googleResults
      latLng = result.geometry.location
      @_resultService.getResult(result.formatted_address, latLng.lat(), latLng.lng())
    )


angular.module('peopleMap.Map')
  .factory 'GeocoderService', ['$q', '$rootScope', 'GeocodeResult', ($q, $rootScope, GeocodeResult) ->
             new Geocoder $q, $rootScope, GeocodeResult
           ]