'use strict';

describe('Controller: EditorCtrl', function () {

  // load the controller's module
  beforeEach(module('PeopleMapAngularApp'));

  var EditorCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller) {
    scope = {};
    EditorCtrl = $controller('EditorCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
