'use strict'

describe 'Controller: EditorCtrl', () ->

  # load the controller's module
  beforeEach module 'PeopleMapAngularApp'

  EditorCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    EditorCtrl = $controller 'EditorCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
