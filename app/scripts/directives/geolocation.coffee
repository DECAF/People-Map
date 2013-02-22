"use strict"

angular.module("peopleMap.directives")
  .directive "geolocation", ['$q', '$rootScope', ($q, $rootScope) ->
               restrict : "A"
               scope    :
                 location        : '='

               controller : ($scope, $element, $attrs) ->
                 geocoder = new Geocoder $q, $rootScope
                 $scope.$watch 'mapSearchString', ->
                   if $scope.mapSearchString is ""
                     $scope.searchResults = []
                   else
                     geocoder.geocode($scope.mapSearchString).then (results) ->
                       $scope.searchResults = results

               link : ($scope, $element, $attrs) ->
                 map = new Map $element.get(0)

                 $scope.$watch 'location', ->
                   map.setCenter $scope.location.latitude, $scope.location.longitude

                 map.load()
             ]


#(elementPath === locationPath) ? $element.addClass("current") : $element.removeClass("current");