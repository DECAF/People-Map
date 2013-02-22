"use strict"

angular.module("peopleMap.directives")
  .directive "editorMap", ['GeocoderService', 'MapService', (GeocoderService, MapService) ->
               restrict : "A"
               scope    :
                 location        : '='
                 mapSearchString : '='
                 searchResults   : '='

               controller : ($scope, $element, $attrs) ->
                 $scope.$watch 'mapSearchString', ->
                   if $scope.mapSearchString is ""
                     $scope.searchResults = []
                   else
                     GeocoderService.geocode($scope.mapSearchString).then (results) ->
                       $scope.searchResults = results

               link : ($scope, $element, $attrs) ->
                 map = MapService.getMap $element.get(0)

                 $scope.$watch 'location', ->
                   map.setCenter $scope.location.latitude, $scope.location.longitude

                 map.load()
             ]


#(elementPath === locationPath) ? $element.addClass("current") : $element.removeClass("current");