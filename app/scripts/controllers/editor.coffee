'use strict'

class EditorController
  @_defaultData : null
  constructor   : (@_$scope, @_mapEntry) ->
  createModel   : () ->
    @_$scope.entry = {}
    @_$scope.onAddLocation = @_onAddLocation
    @_$scope.onRemoveLocation = @_onRemoveLocation
    @_mapEntry.getDefaults().then @_onDefaultData

  _onDefaultData : (data) =>
    @_defaultData = data
    @_$scope.entry = angular.copy data

  _onAddLocation : =>
    unless @_defaultData is null
      location = angular.copy @_defaultData.locations[0]
      @_$scope.entry.locations.push location
      
  _onRemoveLocation: (index) =>
    @_$scope.entry.locations.splice index, 1 if @_$scope.entry.locations[index] isnt undefined


angular.module('peopleMap.controllers')
  .controller 'EditorCtrl', ['$scope', 'MapEntry', ($scope, MapEntry) ->
    editor = new EditorController $scope, MapEntry
    editor.createModel()
  ]