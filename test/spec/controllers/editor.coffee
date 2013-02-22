'use strict'

describe 'Controller: EditorController', () ->

  # load the controller's module
  beforeEach module 'PeopleMapAngularApp'

  EditorController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    EditorController = $controller 'EditorController', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
