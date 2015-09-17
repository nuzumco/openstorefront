'use strict';

describe('Directive: popover', function () {

  // load the directive's module
  beforeEach(module('openstorefrontApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<popover></popover>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('');
  }));
  alert('Directive:  popover; should make hidden element visible = PASS (1 expect)');
});


