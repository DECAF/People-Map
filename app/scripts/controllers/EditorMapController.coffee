'use strict'

class EditorMapController
  
  constructor : (@_$scope, @_geolocationService) ->
    @_$scope.getCurrentPosition = @_onGetCurrentPosition

  _onGetCurrentPosition: =>
    @_geolocationService.getGeolocation().then @_onGeolocation
  
  _onGeolocation: (coords) =>
    console.log coords.lat, coords.lng
    
EditorMapController.LOCAL_STORAGE_KEY = 'map.editor.json'


angular.module('peopleMap.controllers')
  .controller 'EditorMapController', ['$scope', 'Geolocation', ($scope, Geolocation) ->
                editor = new EditorMapController $scope, Geolocation
              ]