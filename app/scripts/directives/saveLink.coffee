"use strict"

angular.module("peopleMap.directives")
  .directive "saveLink", ['API', (API) ->
     restrict : "A"
     link     : ($scope, $element, $attrs) ->
       $attrs.$observe 'saveLink', (value) ->
         $element.off('click.save-link').on 'click.save-link', (e) =>
           data = $scope[value]
           throw new Error "save-link directive: '#{value}' no fount in $scope" if data is undefined
           console.log 'clicked', angular.toJson(data, no)
           
           $element.attr('href', "#{API.SAVE_ENTRY}/#{encodeURIComponent(angular.toJson(data, yes))}")
   ]


#(elementPath === locationPath) ? $element.addClass("current") : $element.removeClass("current");