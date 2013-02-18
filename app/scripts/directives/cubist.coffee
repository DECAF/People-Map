"use strict"

angular.module("peopleMap.directives")
  .directive "cubist", ['$location', ($location) ->
     #template: '<div></div>',
     restrict : "A"
     link     : ($scope, $element, $attrs) ->

       #element.text('this is the cubist directive');
       cube = new Cubist($element[0])
       cube.goto 1
       $scope.$location = $location
       $scope.$watch "$location.path()", (locationPath) ->
         switch locationPath
           when "/map"
             cube.goto 0
           when "/editor"
             cube.goto 1
           else
   ]


#(elementPath === locationPath) ? $element.addClass("current") : $element.removeClass("current");