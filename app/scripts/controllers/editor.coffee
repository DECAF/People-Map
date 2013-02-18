'use strict'

angular.module('peopleMap.controllers')
  .controller 'EditorCtrl', ['$scope', 'MapEntry', ($scope, MapEntry) ->
    Entry = MapEntry.getDefaults()

    #defaultEntry = Entry.get()                
  ]