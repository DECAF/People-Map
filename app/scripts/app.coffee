"use strict"

class ConfigCallback
  constructor : ($locationProvider) ->
    $locationProvider.html5Mode false
    $locationProvider.hashPrefix '!'

ConfigCallback.$inject = ['$locationProvider']

angular.module("peopleMap", ['ngResource', 
                'peopleMap.controllers', 
                'peopleMap.services', 
                'peopleMap.directives', 
                'peopleMap.Map'])
  .config ConfigCallback