'use strict';

describe('Directive: cubist', function () {
  beforeEach(module('PeopleMapAngularApp'));

  var element;

  it('should make hidden element visible', inject(function ($rootScope, $compile) {
    element = angular.element('<cubist></cubist>');
    element = $compile(element)($rootScope);
    expect(element.text()).toBe('this is the cubist directive');
  }));
});
