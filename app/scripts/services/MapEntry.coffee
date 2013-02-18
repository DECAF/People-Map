'use strict';

class MapEntry
  _$http : null
  _api   : null

  constructor : (@_$http, @_api) ->

  getDefaults : () ->
    @_$http.get(@_api.JSON_MAP_ENTRY_DEFAULT)


angular.module('peopleMap.services')
  .factory 'MapEntry', ['$http', 'API', ($http, API) ->
             new MapEntry $http, API
           ]
