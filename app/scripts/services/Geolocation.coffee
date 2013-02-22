'use strict';

class Geolocation
  constructor    : (@_$q, @_$scope) ->

  getGeolocation : ->
    deferred = @_$q.defer()

    navigator.geolocation.getCurrentPosition (position) =>
      @_onSuccess position, deferred
    , (e) =>
      @_onError e, deferred

    return deferred.promise

  _onSuccess : (position, deferred) ->
    deferred.resolve
      lat : position.coords.latitude
      lng : position.coords.longitude
    @_$scope.$digest()

  _onError : (error, deferred) ->
    ### switch error.code
       when error.PERMISSION_DENIED
         message = "User denied the request for Geolocation."
       when error.POSITION_UNAVAILABLE
         message = "Location information is unavailable."
       when error.TIMEOUT
         message = "The request to get user location timed out."
       when error.UNKNOWN_ERROR
         message = "An unknown error occurred."
       else
         message = "An error occured getting the current location."
     ###
    deferred.reject error.message
    @_$scope.$digest()

  hasGeolocation : ->
    Geolocation.HAS_GEOLOCATION

Geolocation.HAS_GEOLOCATION = "geolocation" in navigator

angular.module('peopleMap.services')            
  .factory 'Geolocation', ['$q', '$rootScope', ($q, $rootScope) ->
             new Geolocation $q, $rootScope
           ]
