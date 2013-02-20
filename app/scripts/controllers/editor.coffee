'use strict'

class EditorController
  _defaultData     : null
  _hasLocalStorage : window.localStorage isnt undefined

  constructor : (@_$scope, @_mapEntry) ->
    @_$scope.onAddLocation = @_onAddLocation
    @_$scope.onRemoveLocation = @_onRemoveLocation
    @_$scope.onUploadData = @_onUploadData
    @_$scope.onResetEditor = @_onResetEditor

  createModel : () ->
    if @_hasLocalStorage
      @_loadDefaultData()
    else
      @_fetchDefaultData()

  _loadDefaultData : ->
    try
      console.log 'loading default data'
      available = angular.fromJson(window.localStorage.getItem EditorController.LOCAL_STORAGE_KEY)
      if available
        @_onDefaultData available
      else
        @_fetchDefaultData()
    catch e
      @_fetchDefaultData()

  _fetchDefaultData : ->
    console.log 'fetch default data'
    @_mapEntry.getDefaults().then @_onDefaultData

  _updateLocal : =>
    console.log 'updating local storage', @_$scope
    window.localStorage.setItem(EditorController.LOCAL_STORAGE_KEY, @_getCurrentModelJson()) if @_hasLocalStorage

  _getCurrentModelJson : ->
    angular.toJson @_$scope.entry

  _onDefaultData : (data) =>
    @_$scope.$watch 'entry', @_updateLocal, yes if @_defaultData is null
    
    @_defaultData = data
    @_$scope.entry = angular.copy data

  _onAddLocation : =>
    unless @_defaultData is null
      location = angular.copy @_defaultData.locations[0]
      @_$scope.entry.locations.push location

  _onRemoveLocation : (index) =>
    @_$scope.entry.locations.splice index, 1 if @_$scope.entry.locations[index] isnt undefined

  _onUploadData: =>
    
  _onResetEditor: =>
    @_fetchDefaultData()
    

EditorController.LOCAL_STORAGE_KEY = 'map.editor.json'


angular.module('peopleMap.controllers')
  .controller 'EditorCtrl', ['$scope', 'MapEntry', ($scope, MapEntry) ->
                editor = new EditorController $scope, MapEntry
                editor.createModel()
              ]