"use strict"

HAS_FILE_READER = window.File && window.FileReader && window.FileList && window.Blob

angular.module("peopleMap.directives")
  .directive "jsonUpload", [() ->
               restrict : "A"
               scope    : 
                target: '=uploadTarget'

               link : ($scope, $element, $attrs) ->
                 $element.hide() unless HAS_FILE_READER
                 $element.off('change.json-upload').on 'change.json-upload', (e) =>
                   console.log 'file selected', e

                   file = e.target.files[0]
                   reader = new FileReader()
                   reader.onload = (e) ->
                     $scope.$apply ->
                      $scope.target = angular.fromJson(e.target.result)
                   reader.readAsText(file)
             ]


#(elementPath === locationPath) ? $element.addClass("current") : $element.removeClass("current");