'use strict';

class MapEntry
  _$http : null
  _$q    : null
  _api   : null

  constructor : (@_$http, @_$q, @_api) ->

  getDefaults : () ->
    deferred = @_$q.defer()
    
    
    @_$http.get(@_api.JSON_MAP_ENTRY_DEFAULT).then (response)=>
      deferred.resolve response.data
    , () =>
      deferred.reject 'could not fetch default entry data'
      
    return deferred.promise
    
  saveJson : (data) ->
    form = document.createElement 'form'
    form.target = '_blank'
    form.method = 'POST'
    form.action = @_api.SAVE_ENTRY
    
    dataInput = document.createElement 'input'
    dataInput.type = 'text'
    dataInput.name = 'data'
    dataInput.value = JSON.stringify data
    
    form.appendChild dataInput
    
    form.submit()
    #@_$http.post(@_api.SAVE_ENTRY, data)

angular.module('peopleMap.services')
  .factory 'MapEntry', ['$http', '$q', 'API', ($http, $q, API) ->
             new MapEntry $http, $q, API
           ]
