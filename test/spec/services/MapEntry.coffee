'use strict'

describe 'Service: MapEntry', () ->

  # load the service's module
  beforeEach module 'PeopleMapAngularApp'

  # instantiate service
  MapEntry = {}
  beforeEach inject (_MapEntry_) ->
    MapEntry = _MapEntry_

  it 'should do something', () ->
    expect(!!MapEntry).toBe true;
