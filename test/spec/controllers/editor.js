'use strict';

describe('Controller: EditorController', function () {

  // load the controller's module
  beforeEach(module('PeopleMapAngularApp'));

  var EditorController,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller) {
    scope = {};
    EditorController = $controller('EditorController', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
